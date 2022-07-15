import Vapor

struct JWTToken: Content, Authenticatable, JWTPayload {
    typealias User = App.User
    let expirationTime: TimeInterval = 60 * 60 * 24
    
    var expiration: ExpirationClaim
    var userId: Int
    
    init(userId: Int) {
        self.userId = userId
        self.expiration = ExpirationClaim(value: Date().addingTimeInterval(expirationTime))
    }
    
    init(user: User) throws {
        self.userId = try user.requireID()
        self.expiration = ExpirationClaim(value: Date().addingTimeInterval(expirationTime))
    }
    
    func verify(using signer: JWTSigner) throws {
        try expiration.verifyNotExpired()
    }
}
