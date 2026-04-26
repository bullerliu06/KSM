//
//  NSString+XTCategory.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import UIKit

@objc
extension NSString {
    @objc func xt_trimPhoneNumber() -> String {
        replacingOccurrences(of: "-", with: "").replacingOccurrences(of: " ", with: "")
    }

    @objc func xt_encodeString() -> String {
        guard length > 0 else { return "" }
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self as String
    }

    @objc func xt_hexColor() -> UIColor? {
        guard length > 0 else { return nil }
        var colorString = trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        guard colorString.count >= 6 else { return .clear }
        if colorString.hasPrefix("0X") {
            colorString = String(colorString.dropFirst(2))
        }
        if colorString.hasPrefix("#") {
            colorString = String(colorString.dropFirst())
        }
        guard colorString.count == 6 else { return .clear }

        let redString = String(colorString.prefix(2))
        let greenStart = colorString.index(colorString.startIndex, offsetBy: 2)
        let greenEnd = colorString.index(greenStart, offsetBy: 2)
        let greenString = String(colorString[greenStart..<greenEnd])
        let blueString = String(colorString.suffix(2))

        var red: UInt64 = 0
        var green: UInt64 = 0
        var blue: UInt64 = 0
        Scanner(string: redString).scanHexInt64(&red)
        Scanner(string: greenString).scanHexInt64(&green)
        Scanner(string: blueString).scanHexInt64(&blue)

        return UIColor(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: 1.0
        )
    }

    @objc(xt_isValidateUrl:)
    class func xt_isValidateUrl(_ str: String?) -> Bool {
        guard let str else { return false }
        let regex = "(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: str)
    }

    @objc(xt_average:link:)
    func xt_average(_ num: Int, link: String?) -> String {
        let source = self as String
        if NSString.xt_isEmpty(source) {
            return ""
        }
        if num == 0 {
            return source
        }
        let row = source.count / num
        if row == 0 {
            return source
        }

        let link = link ?? ""
        var arr: [String] = []
        for index in 0..<row {
            let start = source.index(source.startIndex, offsetBy: index * num)
            let end = source.index(start, offsetBy: num)
            arr.append(String(source[start..<end]))
            if index == row - 1 && index * num < source.count {
                let remainder = source.count % num
                let remainderStart = source.index(source.endIndex, offsetBy: -remainder)
                arr.append(String(source[remainderStart..<source.endIndex]))
            }
        }
        return arr.joined(separator: link)
    }

    @objc(xt_strs:fonts:colors:)
    class func xt_strs(_ strs: [String], fonts: [UIFont], colors: [UIColor]) -> NSAttributedString {
        guard !strs.isEmpty, strs.count == fonts.count, strs.count == colors.count else {
            return NSAttributedString()
        }
        let attributed = NSMutableAttributedString()
        for index in strs.indices {
            attributed.append(NSAttributedString(
                string: strs[index],
                attributes: [
                    .font: fonts[index],
                    .foregroundColor: colors[index]
                ]
            ))
        }
        return attributed
    }

    @objc func xt_phonePrivacy() -> String {
        let source = self as String
        if NSString.xt_isEmpty(source) || source.count < 7 {
            return source
        }
        return "\(source.prefix(3))\(String(repeating: "*", count: source.count - 6))\(source.suffix(3))"
    }

    @objc(xt_isEmpty:)
    class func xt_isEmpty(_ string: String?) -> Bool {
        guard let string else { return true }
        if (string as NSString).isKind(of: NSString.self) == false {
            return true
        }
        if string.caseInsensitiveCompare("null") == .orderedSame {
            return true
        }
        if string.isEmpty {
            return true
        }
        if string == "(null)" {
            return true
        }
        return false
    }
}
