//
//  XTAuthenticationFormModels.swift
//  XTApp
//
//  Created by GitHub Copilot on 2026/4/30.
//

import UIKit

@objcMembers
class NoteModel: NSObject, Codable {
    var name: String?
    var type: String?
    var icon: String?

    enum CodingKeys: String, CodingKey {
        case name = "uporsixnNc"
        case type = "itlisixanizeNc"
        case icon = "ieNcsix"
    }

    override init() {
        super.init()
    }

    required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        name = try c.decodeIfPresent(String.self, forKey: .name)
        type = try c.decodeIfPresent(String.self, forKey: .type)
        icon = try c.decodeIfPresent(String.self, forKey: .icon)
        super.init()
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encodeIfPresent(name, forKey: .name)
        try c.encodeIfPresent(type, forKey: .type)
        try c.encodeIfPresent(icon, forKey: .icon)
    }

    var xt_name: String? {
        get { name }
        set { name = newValue }
    }

    var xt_type: String? {
        get { type }
        set { type = newValue }
    }

    var xt_icon: String? {
        get { icon }
        set { icon = newValue }
    }
}

@objcMembers
final class OcrNoteModel: NoteModel {
    var backgroundImageURL: String?

    enum CodingKeys: String, CodingKey {
        case backgroundImageURL = "ovrpsixunchNc"
        case name = "roansixizeNc"
        case type = "ceNcsix"
    }

    override init() {
        super.init()
    }

    required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        super.init()
        backgroundImageURL = try c.decodeIfPresent(String.self, forKey: .backgroundImageURL)
        name = try c.decodeIfPresent(String.self, forKey: .name)
        type = try c.decodeIfPresent(String.self, forKey: .type)
    }

    override func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encodeIfPresent(backgroundImageURL, forKey: .backgroundImageURL)
        try c.encodeIfPresent(name, forKey: .name)
        try c.encodeIfPresent(type, forKey: .type)
    }

    var xt_bg_img: String? {
        get { backgroundImageURL }
        set { backgroundImageURL = newValue }
    }
}

@objcMembers
final class ListModel: NSObject, Codable {
    var id: String?
    var title: String?
    var subtitle: String?
    var code: String?
    var category: String?
    var noteList: [NoteModel]?
    var isOptional: Bool = false
    var value: String?
    var isHiddenCell: Bool = false
    weak var cell: UITableViewCell?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case id = "regnsixNc"
        case title = "fldgsixeNc"
        case subtitle = "orinsixarilyNc"
        case code = "imeasixsurabilityNc"
        case category = "lebosixardNc"
        case noteList = "tubosixdrillNc"
        case value = "darysixmanNc"
        case isOptional = "tapasixxNc"
    }

    override init() {
        super.init()
    }

    required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        id = try c.decodeIfPresent(String.self, forKey: .id)
        title = try c.decodeIfPresent(String.self, forKey: .title)
        subtitle = try c.decodeIfPresent(String.self, forKey: .subtitle)
        code = try c.decodeIfPresent(String.self, forKey: .code)
        category = try c.decodeIfPresent(String.self, forKey: .category)
        let decodedNoteList = try c.decodeIfPresent([NoteModel].self, forKey: .noteList)
        noteList = decodedNoteList
        let decodedValue = try c.decodeIfPresent(String.self, forKey: .value)
        value = decodedValue
        isOptional = (try? c.decode(Bool.self, forKey: .isOptional)) ?? false
        isHiddenCell = false

        if let cat = category, ["AASIXTENBG", "AASIXTENBL", "AASIXTENBJ"].contains(cat) {
            name = value
        } else if let intVal = Int(decodedValue ?? ""), intVal > 0 {
            name = decodedNoteList?.first { $0.type == decodedValue }?.name
        } else {
            name = ""
        }
        super.init()
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encodeIfPresent(id, forKey: .id)
        try c.encodeIfPresent(title, forKey: .title)
        try c.encodeIfPresent(subtitle, forKey: .subtitle)
        try c.encodeIfPresent(code, forKey: .code)
        try c.encodeIfPresent(category, forKey: .category)
        try c.encodeIfPresent(noteList, forKey: .noteList)
        try c.encodeIfPresent(value, forKey: .value)
        try c.encode(isOptional, forKey: .isOptional)
    }

    var xt_id: String? {
        get { id }
        set { id = newValue }
    }

    var xt_title: String? {
        get { title }
        set { title = newValue }
    }

    var xt_subtitle: String? {
        get { subtitle }
        set { subtitle = newValue }
    }

    var xt_code: String? {
        get { code }
        set { code = newValue }
    }

    var xt_cate: String? {
        get { category }
        set { category = newValue }
    }

    var xt_optional: Bool {
        get { isOptional }
        set { isOptional = newValue }
    }

    var xt_value: String? {
        get { value }
        set { value = newValue }
    }
}

@objcMembers
final class ItemsModel: NSObject, Codable {
    var title: String?
    var subTitle: String?
    var hasMore: Bool = false
    var list: [ListModel]?
    var hiddenChild: Bool = false

    enum CodingKeys: String, CodingKey {
        case title = "fldgsixeNc"
        case subTitle = "sub_title"
        case hasMore = "more"
        case list = "xathsixosisNc"
    }

    override init() {
        super.init()
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        title = try c.decodeIfPresent(String.self, forKey: .title)
        subTitle = try c.decodeIfPresent(String.self, forKey: .subTitle)
        hasMore = (try? c.decode(Bool.self, forKey: .hasMore)) ?? false
        list = try c.decodeIfPresent([ListModel].self, forKey: .list)
        super.init()
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encodeIfPresent(title, forKey: .title)
        try c.encodeIfPresent(subTitle, forKey: .subTitle)
        try c.encode(hasMore, forKey: .hasMore)
        try c.encodeIfPresent(list, forKey: .list)
    }

    var xt_title: String? { title }
    var xt_sub_title: String? { subTitle }
    var xt_more: Bool { hasMore }
}

struct VerifyBaseModel: Codable {
    var countdown: Int
    var items: [ItemsModel]?

    enum CodingKeys: String, CodingKey {
        case countdown = "paeosixgrapherNc"
        case items = "ovrfsixraughtNc"
    }
}

@objcMembers
final class VerifyListModel: NSObject, Codable {
    var stepCode: String?
    var title: String?
    var status: String?
    var isCompleted: Bool = false

    enum CodingKeys: String, CodingKey {
        case stepCode = "noassixsessabilityNc"
        case title = "fldgsixeNc"
        case status = "doabsixleNc"
        case isCompleted = "frllsixyNc"
    }

    override init() {
        super.init()
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        stepCode = try c.decodeIfPresent(String.self, forKey: .stepCode)
        title = try c.decodeIfPresent(String.self, forKey: .title)
        status = try c.decodeIfPresent(String.self, forKey: .status)
        isCompleted = (try? c.decode(Bool.self, forKey: .isCompleted)) ?? false
        super.init()
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encodeIfPresent(stepCode, forKey: .stepCode)
        try c.encodeIfPresent(title, forKey: .title)
        try c.encodeIfPresent(status, forKey: .status)
        try c.encode(isCompleted, forKey: .isCompleted)
    }

    var noassixsessabilityNc: String? {
        get { stepCode }
        set { stepCode = newValue }
    }

    var fldgsixeNc: String? {
        get { title }
        set { title = newValue }
    }

    var doabsixleNc: String? {
        get { status }
        set { status = newValue }
    }

    var frllsixyNc: Bool {
        get { isCompleted }
        set { isCompleted = newValue }
    }
}

typealias XTNoteModel = NoteModel
typealias XTOcrNoteModel = OcrNoteModel
typealias XTListModel = ListModel
typealias XTItemsModel = ItemsModel
typealias XTVerifyBaseModel = VerifyBaseModel
typealias XTVerifyListModel = VerifyListModel