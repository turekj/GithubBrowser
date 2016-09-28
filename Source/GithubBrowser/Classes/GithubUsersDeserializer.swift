import Foundation


class GithubUsersDeserializer: UsersDeserializer {

    func deserializeUsers(_ serialized: Any?) throws -> [User] {
        guard let json = serialized as? [String: Any?] else {
            throw DeserializationError.ImproperInputFormat
        }
        
        guard let items = json["items"] as? [Any?] else {
            throw DeserializationError.ImproperInputFormat
        }
        
        return try items.map { try self.deserializeUser($0) }
    }
    
    private func deserializeUser(_ serialized: Any?) throws -> User {
        guard let json = serialized as? [String: Any?] else {
            throw DeserializationError.ImproperInputFormat
        }
        
        guard let id = json["id"] as? Int else {
            throw DeserializationError.ImproperInputFormat
        }
        
        guard let login = json["login"] as? String else {
            throw DeserializationError.ImproperInputFormat
        }
        
        let avatarUrl = json["avatar_url"] as? String
        
        return User(id: id, login: login, avatarUrl: avatarUrl)
    }
}
