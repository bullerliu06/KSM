//
//  XTAuthenticationBankModels.swift
//  XTApp
//
//  Created by GitHub Copilot on 2026/4/30.
//

import Foundation

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

typealias XTBankItemModel = BankItemModel
typealias XTBankModel = BankModel