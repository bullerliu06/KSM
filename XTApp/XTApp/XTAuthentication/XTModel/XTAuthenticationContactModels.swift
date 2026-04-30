//
//  XTAuthenticationContactModels.swift
//  XTApp
//
//  Created by GitHub Copilot on 2026/4/30.
//

import Foundation

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

struct VerifyContactModel: Codable {
    var countdown: Int
    var items: [ContactItemModel]?

    enum CodingKeys: String, CodingKey {
        case countdown = "paeosixgrapherNc"
        case items = "ovrfsixraughtNc"
    }
}

typealias XTContactItemModel = ContactItemModel
typealias XTVerifyContactModel = VerifyContactModel