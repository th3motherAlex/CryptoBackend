import Vapor
import Fluent

func routes(_ app: Application) throws {

    let cryptos = app.grouped("api", "cryptos")

    
    cryptos.get { req async throws in
        try await Crypto.query(on: req.db).all()
    }

    
    cryptos.post { req async throws -> Crypto in
        let crypto = try req.content.decode(Crypto.self)
        try await crypto.save(on: req.db)
        return crypto
    }

   
    cryptos.get(":cryptoID") { req async throws in
        guard let crypto = try await Crypto.find(req.parameters.get("cryptoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return crypto
    }

    cryptos.put(":cryptoID") { req async throws in
        let updated = try req.content.decode(Crypto.self)
        guard let existing = try await Crypto.find(req.parameters.get("cryptoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        existing.name = updated.name
        existing.symbol = updated.symbol
        existing.price = updated.price
        try await existing.save(on: req.db)
        return existing
    }

    cryptos.delete(":cryptoID") { req async throws -> HTTPStatus in
        guard let crypto = try await Crypto.find(req.parameters.get("cryptoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await crypto.delete(on: req.db)
        return .ok
    }
}
