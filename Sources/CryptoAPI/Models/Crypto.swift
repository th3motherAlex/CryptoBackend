//
//  Crypto.swift.swift
//  CryptoAPI
//
//  Created by Ibarra on 18/06/25.
//
import Fluent
import Vapor

final class Crypto: Model, Content, @unchecked Sendable {
    static let schema = "cryptos"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "symbol")
    var symbol: String

    @Field(key: "price")
    var price: Double

    init() {}

    init(id: UUID? = nil, name: String, symbol: String, price: Double) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.price = price
    }
}

