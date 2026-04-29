//
//  NetworkService.swift
//  XTApp
//
//  Created by Codex on 2026/4/29.
//

import Foundation

// MARK: - Network Errors

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noData
    case serverError(statusCode: Int, message: String?)
    case decodingError(Error)
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        case .serverError(_, let message):
            return message ?? "Server error"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}

// MARK: - HTTP Method

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

typealias NetworkRawResponse = (data: [String: Any]?, message: String?)

// MARK: - NetworkService

final class NetworkService {
    static let shared = NetworkService()

    private let session: URLSession
    private let baseURL: String
    private let localURLPath: String

    private init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 60
        self.session = URLSession(configuration: config)
        self.baseURL = "https://api-16i.ph.dev.ksmdev.top/api"
        self.localURLPath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? "") + "/Locality_Url.txt"
    }

    // MARK: - Base URL

    private var resolvedBaseURL: String {
        if let localURL = try? String(contentsOfFile: localURLPath, encoding: .utf8),
           !localURL.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return localURL.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return baseURL
    }

    // MARK: - Request Headers

    private func buildHeaders() -> [String: String] {
        var headers: [String: String] = [:]
        headers["spdisixlleNc"] = ""
        headers["saursixnicNc"] = "ios"
        headers["andisixcNc"] = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        headers["penisixsetumNc"] = XTDevice.shared.mobileStyle
        headers["exepsixtionalNc"] = XTDevice.shared.idfv
        headers["dedesixningNc"] = XTDevice.shared.sysVersion
        headers["feicsixidalNc"] = "ph"
        headers["prgnsixenoloneNc"] = Bundle.main.bundleIdentifier ?? ""
        if UserSession.shared.isLoggedIn {
            headers["ghstsixNc"] = UserSession.shared.currentUser?.sessionId ?? ""
            headers["raiosixiodineNc"] = UserSession.shared.currentUser?.phone ?? ""
        }
        return headers
    }

    // MARK: - URL with Query Parameters

    func buildURL(path: String, queryParams: [String: String]? = nil) -> String {
        var url = resolvedBaseURL + "/" + path
        let params: [String: String] = queryParams ?? [:]
        // Append device/auth params as query string for GET or as body identifier
        if !params.isEmpty {
            let query = params.map { "\($0.key)=\($0.value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? $0.value)" }
                .joined(separator: "&")
            url += "?" + query
        }
        return url
    }

    // MARK: - Raw Dictionary Request (for legacy data structures)

    func requestRaw(
        path: String,
        method: HTTPMethod = .post,
        body: [String: Any]? = nil,
        queryParams: [String: String]? = nil,
        completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void
    ) {
        let urlString = buildURL(path: path, queryParams: queryParams)
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let headers = buildHeaders()
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        if method == .post, let body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }

        session.dataTask(with: request) { data, response, error in
            let result: Result<NetworkRawResponse, NetworkError>

            if let error {
                result = .failure(.unknown(error))
            } else if let httpResponse = response as? HTTPURLResponse,
                      let data,
                      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                let message = json["msg"] as? String ?? json["message"] as? String
                let code = json["code"] as? Int ?? 0

                if !(200..<300).contains(httpResponse.statusCode) || code < 0 {
                    result = .failure(.serverError(statusCode: httpResponse.statusCode, message: message))
                } else {
                    result = .success((json["data"] as? [String: Any], message))
                }
            } else {
                result = .failure(.noData)
            }

            DispatchQueue.main.async {
                completion(result)
            }
        }.resume()
    }

    // MARK: - Multipart Upload

    func upload(
        path: String,
        fileURL: URL,
        fieldName: String = "am",
        params: [String: String] = [:],
        completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void
    ) {
        let urlString = buildURL(path: path)
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }

        let boundary = "Boundary-\(UUID().uuidString)"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        let headers = buildHeaders()
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        var body = Data()
        for (key, value) in params {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            body.append("\(value)\r\n".data(using: .utf8)!)
        }

        if let fileData = try? Data(contentsOf: fileURL) {
            let fileName = fileURL.lastPathComponent
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
            body.append(fileData)
            body.append("\r\n".data(using: .utf8)!)
        }
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpBody = body

        session.dataTask(with: request) { data, _, error in
            let result: Result<NetworkRawResponse, NetworkError>

            if let error {
                result = .failure(.unknown(error))
            } else if let data,
                      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                let message = json["msg"] as? String ?? json["message"] as? String
                result = .success((json["data"] as? [String: Any], message))
            } else {
                result = .failure(.noData)
            }

            DispatchQueue.main.async {
                completion(result)
            }
        }.resume()
    }
}
