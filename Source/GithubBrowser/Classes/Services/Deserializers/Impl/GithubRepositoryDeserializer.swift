import Foundation


class GithubRepositoryDeserializer: Deserializer {
    
    func deserialize(_ serialized: Any?) throws -> Repository {
        guard let json = serialized as? [String: Any] else {
            throw DeserializationError.improperInputFormat
        }
        
        guard let id = json["id"] as? Int else {
            throw DeserializationError.improperInputFormat
        }
        
        guard let name = json["name"] as? String else {
            throw DeserializationError.improperInputFormat
        }
        
        let ownerDetails = json["owner"] as? [String: Any?]
        let ownerAvatarUrl = ownerDetails?["avatar_url"] as? String
        
        return Repository(id: id, name: name, ownerAvatarUrl: ownerAvatarUrl)
    }
}
