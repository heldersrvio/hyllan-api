import Vapor

struct UserController {
    
//    func index(req: Request) async throws -> [User] {
//        try await Todo.query(on: req.db).all()
//    }

    func create(req: Request) async throws -> User {
        try User.Create.validate(content: req)
        let createUser = try req.content.decode(User.Create.self)
        guard createUser.password == createUser.confirmPassword else {
            throw Abort(.badRequest, reason: "Passwords did not match")
        }
        let user = try User(
            id: nil,
            email: createUser.email,
            password: Bcrypt.hash(createUser.password),
            name: createUser.name
        )
        try await user.save(on: req.db)
        return user
    }

//    func delete(req: Request) async throws -> HTTPStatus {
//        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
//            throw Abort(.notFound)
//        }
//        try await todo.delete(on: req.db)
//        return .noContent
//    }
//    
//    func login(req: Request) -> ClientTokenResponse {
//        
//    }
}
