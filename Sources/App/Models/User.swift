import Fluent
import Vapor

final class User: Model, Content, Authenticatable {
    static let schema = "user"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "password")
    var password: String
    
    @Field(key: "name")
    var name: String
    
    init() { }
    
    init(id: UUID? = nil, email: String, password: String, name: String) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
    }
    
    struct Create: Content, Validatable {
        var name: String
        var email: String
        var password: String
        var confirmPassword: String
        
        static func validations(_ validations: inout Validations) {
            validations.add("name", as: String.self, is: !.empty)
            validations.add("email", as: String.self, is: .email)
            validations.add("password", as: String.self, is: .count(8...))
        }
    }
}
