import Fluent
import Vapor

func routes(_ app: Application) throws {
    typealias User = App.User
    let userController = UserController()
    
    app.group("users") { users in
        users.get(use: userController.index)
        users.post(use: userController.create)
        
        users.post("login") { req in
            let user = try req.auth.require(User.self)
            let payload = try 
        }
    }
}
