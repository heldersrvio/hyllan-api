import Fluent
import Vapor

struct User: Model, Content, Authenticatable {
    static let schema = "user"
    
    @ID(key: .id)
    var id: Int
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "password")
    var password: String
    
    @Field(key: "name")
    var name: String
    
    init() { }
    
    init(id: Int? = nil, email: String, password: String, name: String) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
    }
}
