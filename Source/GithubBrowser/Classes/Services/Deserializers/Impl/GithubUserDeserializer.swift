import Foundation


class GithubUserDeserializer: Deserializer {

    func deserialize(_ serialized: Any?) throws -> User {
        guard let json = serialized as? [String: Any] else {
            throw DeserializationError.improperInputFormat
        }
        
        guard let id = json["id"] as? Int else {
            throw DeserializationError.improperInputFormat
        }
        
        guard let login = json["login"] as? String else {
            throw DeserializationError.improperInputFormat
        }
        
        let avatarUrl = json["avatar_url"] as? String
        
        return User(id: id, login: login, avatarUrl: avatarUrl)
    }
}
