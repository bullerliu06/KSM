//
//  XTAuthenticationModels.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import UIKit

// MARK: - Note Model (selection option)

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

// MARK: - OCR Note Model

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

// MARK: - List Model (form field)

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

    // Computed / transient
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

        // Compute display name
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

// MARK: - Items Model (section with fields)

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

// MARK: - Verify Base Model

struct VerifyBaseModel: Codable {
    var countdown: Int
    var items: [ItemsModel]?

    enum CodingKeys: String, CodingKey {
        case countdown = "paeosixgrapherNc"
        case items = "ovrfsixraughtNc"
    }
}

// MARK: - Contact Item Model

@objcMembers
final class ContactItemModel: NSObject, Codable {
    var title: String?
    var fields: [AnyCodable]?
    var relation: [NoteModel]?
    var name: String?
    var mobile: String?
    var relationType: String?

    var firstValue: String?
    var secondValue: String?
    var thirdValue: String?
    var thirdName: String?

    enum CodingKeys: String, CodingKey {
        case title = "fldgsixeNc"
        case fields = "inhosixationNc"
        case relation = "bedisixeNc"
        case nameNested = "koNcsix"
    }

    private enum NestedKeys: String, CodingKey {
        case name = "uporsixnNc"
        case mobile = "halosixwNc"
        case relationType = "bedisixeNc"
    }

    override init() {
        super.init()
    }

    required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        title = try c.decodeIfPresent(String.self, forKey: .title)
        fields = try c.decodeIfPresent([AnyCodable].self, forKey: .fields)
        let decodedRelation = try c.decodeIfPresent([NoteModel].self, forKey: .relation)
        relation = decodedRelation
        if let nested = try? c.nestedContainer(keyedBy: NestedKeys.self, forKey: .nameNested) {
            name = try nested.decodeIfPresent(String.self, forKey: .name)
            mobile = try nested.decodeIfPresent(String.self, forKey: .mobile)
            let decodedRelationType = try nested.decodeIfPresent(String.self, forKey: .relationType)
            relationType = decodedRelationType
            thirdValue = decodedRelationType
            thirdName = decodedRelation?.first { $0.type == decodedRelationType }?.name
        } else {
            thirdValue = nil
            thirdName = nil
        }
        firstValue = name
        secondValue = mobile
        super.init()
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encodeIfPresent(title, forKey: .title)
        try c.encodeIfPresent(relation, forKey: .relation)
    }

    var xt_title: String? {
        get { title }
        set { title = newValue }
    }

    var xt_field: [AnyCodable]? {
        get { fields }
        set { fields = newValue }
    }

    var xt_name: String? {
        get { name }
        set { name = newValue }
    }

    var xt_mobile: String? {
        get { mobile }
        set { mobile = newValue }
    }

    var xt_relation: String? {
        get { relationType }
        set { relationType = newValue }
    }

    var threeValue: String? {
        get { thirdValue }
        set { thirdValue = newValue }
    }

    var threeName: String? {
        get { thirdName }
        set { thirdName = newValue }
    }
}

// MARK: - Verify Contact Model

struct VerifyContactModel: Codable {
    var countdown: Int
    var items: [ContactItemModel]?

    enum CodingKeys: String, CodingKey {
        case countdown = "paeosixgrapherNc"
        case items = "ovrfsixraughtNc"
    }
}

// MARK: - Photo Model

final class PhotoModel: Codable {
    var relationId: String?
    var imageURL: String?
    var type: String?
    var notes: [OcrNoteModel]?
    var list: [ListModel]?
    var path: String?
    var value: String?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case relationId = "darysixmanNc"
        case imageURL = "relosixomNc"
        case type = "decasixleNc"
        case notes = "tubosixdrillNc"
        case list = "xathsixosisNc"
    }

    required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        relationId = try c.decodeIfPresent(String.self, forKey: .relationId)
        imageURL = try c.decodeIfPresent(String.self, forKey: .imageURL)
        type = try c.decodeIfPresent(String.self, forKey: .type)
        notes = try c.decodeIfPresent([OcrNoteModel].self, forKey: .notes)
        list = try c.decodeIfPresent([ListModel].self, forKey: .list)
        name = notes?.first { $0.type == type }?.name
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encodeIfPresent(relationId, forKey: .relationId)
        try c.encodeIfPresent(imageURL, forKey: .imageURL)
        try c.encodeIfPresent(type, forKey: .type)
        try c.encodeIfPresent(notes, forKey: .notes)
        try c.encodeIfPresent(list, forKey: .list)
    }

    var xt_relation_id: String? {
        get { relationId }
        set { relationId = newValue }
    }

    var xt_img: String? {
        get { imageURL }
        set { imageURL = newValue }
    }

    var xt_type: String? {
        get { type }
        set { type = newValue }
    }

    var xt_name: String? {
        get { name }
        set { name = newValue }
    }

    var note: [XTNoteModel]? {
        get { notes }
        set { notes = newValue as? [OcrNoteModel] }
    }
}

// MARK: - OCR Model

struct OcrModel: Codable {
    var countdown: Int
    var model: PhotoModel?

    enum CodingKeys: String, CodingKey {
        case countdown = "paeosixgrapherNc"
        case model = "casasixbNc"
    }
}

// MARK: - Face Model

struct FaceModel: Codable {
    var relationId: String?
    var url: String?
    var isLiveness: Bool?

    enum CodingKeys: String, CodingKey {
        case relationId = "darysixmanNc"
        case url = "relosixomNc"
        case isLiveness = "fonNsixc"
    }

    var xt_relation_id: String? { relationId }
    var xt_url: String? { url }
}

// MARK: - Bank Item Model

@objcMembers
final class BankItemModel: NSObject, Codable {
    var notes: [NoteModel]?
    var channel: String?
    var channelName: String?
    var account: String?

    enum CodingKeys: String, CodingKey {
        case notes = "unrdsixerlyNc"
        case channelNested = "koNcsix"
    }

    private enum NestedKeys: String, CodingKey {
        case channel = "blthsixelyNc"
        case account = "ovrcsixutNc"
    }

    override init() {
        super.init()
    }

    required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        let decodedNotes = try c.decodeIfPresent([NoteModel].self, forKey: .notes)
        notes = decodedNotes
        let decodedChannel: String?
        if let nested = try? c.nestedContainer(keyedBy: NestedKeys.self, forKey: .channelNested) {
            decodedChannel = try nested.decodeIfPresent(String.self, forKey: .channel)
            channel = decodedChannel
            let rawAccount = try nested.decodeIfPresent(String.self, forKey: .account)
            account = rawAccount
        } else {
            decodedChannel = nil
        }
        channelName = decodedNotes?.first { $0.type == decodedChannel }?.name

        // Prefix phone with "0" if needed
        if account == nil || account!.isEmpty {
            let phone = UserSession.shared.currentUser?.phone ?? ""
            account = phone.hasPrefix("0") ? phone : "0\(phone)"
        }
        super.init()
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encodeIfPresent(notes, forKey: .notes)
    }

    var note: [NoteModel]? {
        get { notes }
        set { notes = newValue }
    }

    var xt_channel: String? {
        get { channel }
        set { channel = newValue }
    }

    var xt_channel_name: String? {
        get { channelName }
        set { channelName = newValue }
    }

    var xt_account: String? {
        get { account }
        set { account = newValue }
    }
}

// MARK: - Bank Model

@objcMembers
final class BankModel: NSObject, Codable {
    var countdown: Int = 0
    var bankItem: BankItemModel?
    var walletItem: BankItemModel?

    enum CodingKeys: String, CodingKey {
        case countdown = "paeosixgrapherNc"
        case bankItem = "murasixyNc"
        case walletItem = "abensixtlyNc"
    }

    override init() {
        super.init()
    }

    required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        countdown = (try? c.decode(Int.self, forKey: .countdown)) ?? 0
        bankItem = try c.decodeIfPresent(BankItemModel.self, forKey: .bankItem)
        walletItem = try c.decodeIfPresent(BankItemModel.self, forKey: .walletItem)
        super.init()
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(countdown, forKey: .countdown)
        try c.encodeIfPresent(bankItem, forKey: .bankItem)
        try c.encodeIfPresent(walletItem, forKey: .walletItem)
    }

    var xt_countdown: Int {
        get { countdown }
        set { countdown = newValue }
    }

    var bankModel: XTBankItemModel? {
        get { bankItem }
        set { bankItem = newValue }
    }

    var walletModel: XTBankItemModel? {
        get { walletItem }
        set { walletItem = newValue }
    }
}

// MARK: - Verify List Model

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

// MARK: - Typealias for legacy call sites

typealias XTNoteModel = NoteModel
typealias XTOcrNoteModel = OcrNoteModel
typealias XTListModel = ListModel
typealias XTItemsModel = ItemsModel
typealias XTVerifyBaseModel = VerifyBaseModel
typealias XTContactItemModel = ContactItemModel
typealias XTVerifyContactModel = VerifyContactModel
typealias XTPhotoModel = PhotoModel
typealias XTOcrModel = OcrModel
typealias XTFaceModel = FaceModel
typealias XTBankItemModel = BankItemModel
typealias XTBankModel = BankModel
typealias XTVerifyListModel = VerifyListModel
