//
//  XTMyModels.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation

// MARK: - Extend List Model

struct ExtendListModel: Codable {
    var title: String?
    var icon: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case title = "fldgsixeNc"
        case icon = "ieNcsix"
        case url = "relosixomNc"
    }

    var xt_title: String? {
        get { title }
        set { title = newValue }
    }

    var xt_icon: String? {
        get { icon }
        set { icon = newValue }
    }

    var xt_url: String? {
        get { url }
        set { url = newValue }
    }
}

// MARK: - Repayment Model

struct RepaymentModel: Codable {
    var orderNo: String?
    var productId: String?
    var date: String?
    var amount: String?
    var productName: String?
    var icon: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case orderNo = "spsmsixogenicNc"
        case productId = "lietsixusNc"
        case date = "acepsixtablyNc"
        case amount = "geersixalitatNc"
        case productName = "moossixyllabismNc"
        case icon = "sihosixuetteNc"
        case url = "relosixomNc"
    }

    var xt_order_no: String? {
        get { orderNo }
        set { orderNo = newValue }
    }

    var xt_product_id: String? {
        get { productId }
        set { productId = newValue }
    }

    var xt_date: String? {
        get { date }
        set { date = newValue }
    }

    var xt_amount: String? {
        get { amount }
        set { amount = newValue }
    }

    var xt_product_name: String? {
        get { productName }
        set { productName = newValue }
    }

    var xt_icon: String? {
        get { icon }
        set { icon = newValue }
    }

    var xt_url: String? {
        get { url }
        set { url = newValue }
    }
}

// MARK: - My Model

@objcMembers
final class MyModel: NSObject, Codable {
    var memberURL: String?
    var repayment: RepaymentModel?
    var extendLists: [ExtendListModel]?

    enum CodingKeys: String, CodingKey {
        case memberURL = "deensixsiveNc"
        case repayment = "unqusixalizeNc"
        case extendLists = "mehasixemoglobinNc"
    }

    override init() {
        super.init()
    }

    required init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        memberURL = try c.decodeIfPresent(String.self, forKey: .memberURL)
        repayment = try c.decodeIfPresent(RepaymentModel.self, forKey: .repayment)
        extendLists = try c.decodeIfPresent([ExtendListModel].self, forKey: .extendLists)
        super.init()
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encodeIfPresent(memberURL, forKey: .memberURL)
        try c.encodeIfPresent(repayment, forKey: .repayment)
        try c.encodeIfPresent(extendLists, forKey: .extendLists)
    }

    var xt_memberUrl: String? {
        get { memberURL }
        set { memberURL = newValue }
    }
}

// MARK: - Order Model

@objcMembers
final class OrderModel: NSObject, Codable {
    var orderId: String?
    var productId: String?
    var inside: String?
    var productName: String?
    var productLogo: String?
    var orderStatus: String?
    var orderStatusDesc: String?
    var orderStatusColor: String?
    var orderAmount: String?
    var loanDetailURL: String?
    var buttonText: String?
    var buttonBackground: String?
    var repayTime: String?
    var showVerification: Bool = false

    enum CodingKeys: String, CodingKey {
        case orderId = "sttesixhoodNc"
        case productId = "munisixumNc"
        case inside = "quntsixasomeNc"
        case productName = "moossixyllabismNc"
        case productLogo = "sihosixuetteNc"
        case orderStatus = "covisixctiveNc"
        case orderStatusDesc = "laarsixckianNc"
        case orderStatusColor = "imotsixenceNc"
        case orderAmount = "istasixcNc"
        case loanDetailURL = "aplisixcableNc"
        case buttonText = "maansixNc"
        case buttonBackground = "shkasixriNc"
        case repayTime = "exersixiencelessNc"
        case showVerification = "detrsixogyrateNc"
    }

    override init() {
        super.init()
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        orderId = try c.decodeIfPresent(String.self, forKey: .orderId)
        productId = try c.decodeIfPresent(String.self, forKey: .productId)
        inside = try c.decodeIfPresent(String.self, forKey: .inside)
        productName = try c.decodeIfPresent(String.self, forKey: .productName)
        productLogo = try c.decodeIfPresent(String.self, forKey: .productLogo)
        orderStatus = try c.decodeIfPresent(String.self, forKey: .orderStatus)
        orderStatusDesc = try c.decodeIfPresent(String.self, forKey: .orderStatusDesc)
        orderStatusColor = try c.decodeIfPresent(String.self, forKey: .orderStatusColor)
        orderAmount = try c.decodeIfPresent(String.self, forKey: .orderAmount)
        loanDetailURL = try c.decodeIfPresent(String.self, forKey: .loanDetailURL)
        buttonText = try c.decodeIfPresent(String.self, forKey: .buttonText)
        buttonBackground = try c.decodeIfPresent(String.self, forKey: .buttonBackground)
        repayTime = try c.decodeIfPresent(String.self, forKey: .repayTime)
        showVerification = (try? c.decode(Bool.self, forKey: .showVerification)) ?? false
        super.init()
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encodeIfPresent(orderId, forKey: .orderId)
        try c.encodeIfPresent(productId, forKey: .productId)
        try c.encodeIfPresent(inside, forKey: .inside)
        try c.encodeIfPresent(productName, forKey: .productName)
        try c.encodeIfPresent(productLogo, forKey: .productLogo)
        try c.encodeIfPresent(orderStatus, forKey: .orderStatus)
        try c.encodeIfPresent(orderStatusDesc, forKey: .orderStatusDesc)
        try c.encodeIfPresent(orderStatusColor, forKey: .orderStatusColor)
        try c.encodeIfPresent(orderAmount, forKey: .orderAmount)
        try c.encodeIfPresent(loanDetailURL, forKey: .loanDetailURL)
        try c.encodeIfPresent(buttonText, forKey: .buttonText)
        try c.encodeIfPresent(buttonBackground, forKey: .buttonBackground)
        try c.encodeIfPresent(repayTime, forKey: .repayTime)
        try c.encode(showVerification, forKey: .showVerification)
    }

    var xt_orderId: String? {
        get { orderId }
        set { orderId = newValue }
    }

    var xt_productId: String? {
        get { productId }
        set { productId = newValue }
    }

    var xt_inside: String? {
        get { inside }
        set { inside = newValue }
    }

    var xt_productName: String? {
        get { productName }
        set { productName = newValue }
    }

    var xt_productLogo: String? {
        get { productLogo }
        set { productLogo = newValue }
    }

    var xt_orderStatus: String? {
        get { orderStatus }
        set { orderStatus = newValue }
    }

    var xt_orderStatusDesc: String? {
        get { orderStatusDesc }
        set { orderStatusDesc = newValue }
    }

    var xt_orderStatusColor: String? {
        get { orderStatusColor }
        set { orderStatusColor = newValue }
    }

    var xt_orderAmount: String? {
        get { orderAmount }
        set { orderAmount = newValue }
    }

    var xt_loanDetailUrl: String? {
        get { loanDetailURL }
        set { loanDetailURL = newValue }
    }

    var xt_buttonText: String? {
        get { buttonText }
        set { buttonText = newValue }
    }

    var xt_buttonBackground: String? {
        get { buttonBackground }
        set { buttonBackground = newValue }
    }

    var xt_repayTime: String? {
        get { repayTime }
        set { repayTime = newValue }
    }

    var xt_showVerification: Bool {
        get { showVerification }
        set { showVerification = newValue }
    }
}

// MARK: - Typealias for legacy call sites

typealias XTExtendListModel = ExtendListModel
typealias XTRepaymentModel = RepaymentModel
typealias XTMyModel = MyModel
typealias XTOrderModel = OrderModel
