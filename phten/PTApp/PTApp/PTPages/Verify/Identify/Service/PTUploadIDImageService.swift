//
//  PTUploadIDImageService.swift
//  PTApp
//

import AFNetworking
import UIKit
import YTKNetwork

@objc(PTUploadIDImageService)
class PTUploadIDImageService: PTBaseRequest {
    private let image: UIImage
    private let params: NSDictionary

    @objc(initWithImage:param:)
    init(image: UIImage, param params: NSDictionary?) {
        self.image = image
        self.params = params ?? [:]
        super.init()
        isShowLoading = true
    }

    override func requestMethod() -> YTKRequestMethod {
        .POST
    }

    override func requestUrl() -> String {
        "tenca/ocr"
    }

    override var constructingBodyBlock: AFConstructingBlock? {
        get {
            { [weak self] formData in
                guard let self,
                      let data = Self.jpegData(for: self.image, maxKilobytes: 1024) else {
                    return
                }

                formData.appendPart(
                    withFileData: data,
                    name: "am",
                    fileName: "imageFile.jpg",
                    mimeType: "image/jpeg"
                )
            }
        }
        set {}
    }

    @objc var responseFileId: String? {
        guard let json = responseJSONObject as? [String: Any],
              let result = json["resultObject"] as? [String: Any] else {
            return nil
        }
        return result["file_id"] as? String
    }

    override func requestArgument() -> Any {
        params
    }

    private static func jpegData(for image: UIImage, maxKilobytes: Int) -> Data? {
        let maxBytes = maxKilobytes * 1024
        var quality: CGFloat = 0.9
        let minQuality: CGFloat = 0.1
        var data = image.jpegData(compressionQuality: quality)

        while let currentData = data, currentData.count > maxBytes, quality > minQuality {
            quality -= 0.1
            data = image.jpegData(compressionQuality: quality)
        }

        return data
    }
}
