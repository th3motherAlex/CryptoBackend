//
//  CreateCrypto.swift
//  CryptoAPI
//
//  Created by Ibarra on 18/06/25.
//

import Fluent

struct CreateCrypto: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("cryptos")
            .id()
            .field("name", .string, .required)
            .field("symbol", .string, .required)
            .field("price", .double, .required)
            .create()
            .flatMap {
                let cryptos: [Crypto] = [
                    .init(name: "Bitcoin", symbol: "BTC", price: 67000),
                    .init(name: "Ethereum", symbol: "ETH", price: 3500),
                    .init(name: "Cardano", symbol: "ADA", price: 0.45),
                    .init(name: "Solana", symbol: "SOL", price: 145.32),
                    .init(name: "Polkadot", symbol: "DOT", price: 7.06),
                    .init(name: "Avalanche", symbol: "AVAX", price: 27.4),
                    .init(name: "Dogecoin", symbol: "DOGE", price: 0.13),
                    .init(name: "Chainlink", symbol: "LINK", price: 16.92),
                    .init(name: "Uniswap", symbol: "UNI", price: 6.1),
                    .init(name: "Litecoin", symbol: "LTC", price: 84.5),
                    .init(name: "NEAR Protocol", symbol: "NEAR", price: 5.8),
                    .init(name: "VeChain", symbol: "VET", price: 0.034),
                    .init(name: "Cosmos", symbol: "ATOM", price: 9.88),
                    .init(name: "Stellar", symbol: "XLM", price: 0.10),
                    .init(name: "Algorand", symbol: "ALGO", price: 0.15),
                    .init(name: "Internet Computer", symbol: "ICP", price: 8.7),
                    .init(name: "Aptos", symbol: "APT", price: 7.4),
                    .init(name: "Render", symbol: "RNDR", price: 10.4),
                    .init(name: "Toncoin", symbol: "TON", price: 6.2),
                    .init(name: "Arbitrum", symbol: "ARB", price: 1.12)
                ]
                return cryptos.create(on: database)
            }
    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("cryptos").delete()
    }
}
