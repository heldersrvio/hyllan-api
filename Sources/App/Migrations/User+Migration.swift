import Fluent
import Vapor

extension User {
    struct Migration: AsyncMigration {
        var name: String { "CreateUser" }
        
        func prepare(on database: Database) async throws {
            try await database.schema("users")
                .id()
                .field("name", .string, .required)
                .field("email", .string, .required)
                .field("password", .string, .required)
                .unique(on: "email")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema("users").delete()
        }
    }
}
