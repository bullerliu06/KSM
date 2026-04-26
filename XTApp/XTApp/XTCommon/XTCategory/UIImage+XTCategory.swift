//
//  UIImage+XTCategory.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import UIKit

@objc
extension UIImage {
    @objc(xt_compressWithLengthLimit:)
    func xt_compress(withLengthLimit maxLength: UInt) -> Data {
        var compression: CGFloat = 1
        var data = jpegData(compressionQuality: compression) ?? Data()
        if data.count < maxLength {
            return data
        }

        var maxCompression: CGFloat = 1
        var minCompression: CGFloat = 0
        for _ in 0..<6 {
            compression = (maxCompression + minCompression) / 2
            data = jpegData(compressionQuality: compression) ?? Data()
            if Double(data.count) < Double(maxLength) * 0.9 {
                minCompression = compression
            } else if data.count > maxLength {
                maxCompression = compression
            } else {
                break
            }
        }
        if data.count < maxLength {
            return data
        }

        var resultImage = UIImage(data: data) ?? self
        var lastDataLength = 0
        while data.count > maxLength && data.count != lastDataLength {
            lastDataLength = data.count
            let ratio = CGFloat(maxLength) / CGFloat(data.count)
            let size = CGSize(
                width: CGFloat(Int(resultImage.size.width * sqrt(ratio))),
                height: CGFloat(Int(resultImage.size.height * sqrt(ratio)))
            )
            UIGraphicsBeginImageContext(size)
            resultImage.draw(in: CGRect(origin: .zero, size: size))
            resultImage = UIGraphicsGetImageFromCurrentImageContext() ?? resultImage
            UIGraphicsEndImageContext()
            data = resultImage.jpegData(compressionQuality: compression) ?? data
        }
        return data
    }

    @objc(xt_imageCompressWithLengthLimit:)
    func xt_imageCompress(withLengthLimit maxLength: UInt) -> UIImage? {
        UIImage(data: xt_compress(withLengthLimit: maxLength))
    }

    @objc(xt_compressQualityWithLengthLimit:)
    func xt_compressQuality(withLengthLimit maxLength: Int) -> Data {
        var compression: CGFloat = 1
        var data = jpegData(compressionQuality: compression) ?? Data()
        while data.count > maxLength && compression > 0 {
            compression -= 0.02
            data = jpegData(compressionQuality: compression) ?? data
        }
        return data
    }

    @objc(xt_compressMidQualityWithLengthLimit:)
    func xt_compressMidQuality(withLengthLimit maxLength: Int) -> Data {
        var compression: CGFloat = 1
        var data = jpegData(compressionQuality: compression) ?? Data()
        if data.count < maxLength {
            return data
        }

        var maxCompression: CGFloat = 1
        var minCompression: CGFloat = 0
        for _ in 0..<6 {
            compression = (maxCompression + minCompression) / 2
            data = jpegData(compressionQuality: compression) ?? data
            if Double(data.count) < Double(maxLength) * 0.9 {
                minCompression = compression
            } else if data.count > maxLength {
                maxCompression = compression
            } else {
                break
            }
        }
        return data
    }

    @objc(xt_compressBySizeWithLengthLimit:)
    func xt_compressBySize(withLengthLimit maxLength: UInt) -> Data {
        var resultImage = self
        var data = resultImage.jpegData(compressionQuality: 1) ?? Data()
        var lastDataLength = 0
        while data.count > maxLength && data.count != lastDataLength {
            lastDataLength = data.count
            let ratio = CGFloat(maxLength) / CGFloat(data.count)
            let size = CGSize(
                width: CGFloat(Int(resultImage.size.width * sqrt(ratio))),
                height: CGFloat(Int(resultImage.size.height * sqrt(ratio)))
            )
            UIGraphicsBeginImageContext(size)
            resultImage.draw(in: CGRect(origin: .zero, size: size))
            resultImage = UIGraphicsGetImageFromCurrentImageContext() ?? resultImage
            UIGraphicsEndImageContext()
            data = resultImage.jpegData(compressionQuality: 1) ?? data
        }
        return data
    }
}
