//
//  AppAPI.swift
//  XTApp
//
//  Created by Codex on 2026/4/29.
//
//  All API endpoint definitions, replacing the YTKNetwork-based XTNetworkApis.swift
//

import Foundation

// MARK: - API Endpoints

extension NetworkService {

    // MARK: Auth

    func auth(productId: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/auth", body: ["lietsixusNc": productId], completion: completion)
    }

    func authError(errorStr: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        requestRaw(path: "sixca/auth_err", body: ["darysixmanNc": errorStr]) { result in
            completion(result.map { _ in () })
        }
    }

    func card(productId: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/card", body: ["lietsixusNc": productId], completion: completion)
    }

    func cardNext(params: [String: Any], completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/card_next", body: params, completion: completion)
    }

    func contact(productId: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/contact", body: [
            "lietsixusNc": productId,
            "seissixacredNc": "blaalleynk"
        ], completion: completion)
    }

    func contactNext(params: [String: Any], completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/contact_next", body: params, completion: completion)
    }

    func detection(productId: String, livenessId: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/detection", body: [
            "lietsixusNc": productId,
            "gyossixeNc": livenessId
        ], completion: completion)
    }

    func license(completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/license", body: [:], completion: completion)
    }

    func limit(productId: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/limit", body: ["lietsixusNc": productId], completion: completion)
    }

    func person(productId: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/person", body: [
            "lietsixusNc": productId,
            "bunasixbleNc": "stauistill"
        ], completion: completion)
    }

    func personNext(params: [String: Any], completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/person_next", body: params, completion: completion)
    }

    func photo(productId: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/photo", body: ["lietsixusNc": productId], completion: completion)
    }

    func photoNext(params: [String: Any], completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/photo_next", body: params, completion: completion)
    }

    func saveAuth(params: [String: Any], completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixca/saveauth", body: params, completion: completion)
    }

    func uploadOCR(filePath: String, typeId: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        let fileURL = URL(fileURLWithPath: filePath)
        upload(path: "sixca/ocr", fileURL: fileURL, params: ["light": typeId], completion: completion)
    }

    // MARK: Device / Location / Market

    func reportDevice(params: [String: Any], completion: @escaping (Result<Void, NetworkError>) -> Void) {
        requestRaw(path: "sixcr/device", body: params) { result in
            completion(result.map { _ in () })
        }
    }

    func reportLocation(params: [String: Any], completion: @escaping (Result<Void, NetworkError>) -> Void) {
        requestRaw(path: "sixcr/location", body: params) { result in
            completion(result.map { _ in () })
        }
    }

    func reportMarket(idfv: String, idfa: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        requestRaw(path: "sixcr/market", body: [
            "manisixcideNc": idfv,
            "patusixrageNc": idfa,
            "asdfasasdgwg": "fewfdf",
            "ATETH": "123123555"
        ]) { result in
            completion(result.map { _ in () })
        }
    }

    func reportAdid(idfv: String, adid: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        requestRaw(path: "sixcr/aio", body: [
            "exepsixtionalNc": idfv,
            "fkgjsixgkxdkcnNc": adid
        ]) { result in
            completion(result.map { _ in () })
        }
    }

    // MARK: First / Home

    func fetchIndex(completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixch/index", method: .get, completion: completion)
    }

    func fetchPopUp(completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixch/pop-up", method: .get, completion: completion)
    }

    func fetchHome(completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixch/home", method: .get, completion: completion)
    }

    // MARK: Loan / Order

    func apply(productId: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixnv2/gce/apply", body: [
            "lietsixusNc": productId,
            "fuhasixmNc": "cakestand"
        ], completion: completion)
    }

    func detail(productId: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixnv2/gce/detail", body: ["lietsixusNc": productId], completion: completion)
    }

    func push(orderId: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixnv2/gce/push", body: [
            "spsmsixogenicNc": orderId,
            "ditosixmeNc": "houijhyus"
        ], completion: completion)
    }

    func orderList(orderType: String, page: Int, pageSize: Int = 20, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "ph/loan/order-list", body: [
            "hafbsixackNc": orderType,
            "leitsiximismNc": "\(page)",
            "catosixnizationNc": "\(pageSize)"
        ], completion: completion)
    }

    // MARK: User / Account

    func login(params: [String: Any], completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixcp/login", body: params, completion: completion)
    }

    func getPhoneCode(phone: String, completion: @escaping (Result<NetworkRawResponse, NetworkError>) -> Void) {
        requestRaw(path: "sixcp/get_code", body: [
            "chresixographyNc": phone,
            "betysixNc": "juyttrr"
        ], completion: completion)
    }

    func logout(completion: @escaping (Result<Void, NetworkError>) -> Void) {
        requestRaw(path: "sixcp/logout", method: .get) { result in
            completion(result.map { _ in () })
        }
    }

    func deleteAccount(completion: @escaping (Result<Void, NetworkError>) -> Void) {
        requestRaw(path: "ph/user/del-account", body: [:]) { result in
            completion(result.map { _ in () })
        }
    }
}
