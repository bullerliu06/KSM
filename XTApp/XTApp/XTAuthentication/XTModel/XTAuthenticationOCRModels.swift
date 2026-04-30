//
//  XTAuthenticationOCRModels.swift
//  XTApp
//
//  Created by GitHub Copilot on 2026/4/30.
//

import Foundation

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

struct OcrModel: Codable {
    var countdown: Int
    var model: PhotoModel?

    enum CodingKeys: String, CodingKey {
        case countdown = "paeosixgrapherNc"
        case model = "casasixbNc"
    }
}

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

typealias XTPhotoModel = PhotoModel
typealias XTOcrModel = OcrModel
typealias XTFaceModel = FaceModel