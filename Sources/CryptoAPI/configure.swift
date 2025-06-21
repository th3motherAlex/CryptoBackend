import Fluent
import FluentMySQLDriver
import Vapor
import NIOSSL


public func configure(_ app: Application) async throws {
      app.databases.use(.mysql(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database",
        tlsConfiguration: .forClient(certificateVerification: .none) 
    ), as: .mysql)

    app.migrations.add(CreateCrypto())
    try routes(app)
}
