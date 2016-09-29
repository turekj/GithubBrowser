import Foundation


class GithubRepositoriesDeserializer: RepositoriesDeserializer {
    
    func deserializeRepositories(_ serialized: Any?) throws -> [Repository] {
        guard let json = serialized as? [String: Any?] else {
            throw DeserializationError.ImproperInputFormat
        }
        
        guard let items = json["items"] as? [Any?] else {
            throw DeserializationError.ImproperInputFormat
        }
        
        return try items.map { try self.deserializeRepository($0) }
    }
    
    private func deserializeRepository(_ serialized: Any?) throws -> Repository {
        guard let json = serialized as? [String: Any?] else {
            throw DeserializationError.ImproperInputFormat
        }
        
        guard let id = json["id"] as? Int else {
            throw DeserializationError.ImproperInputFormat
        }
        
        guard let name = json["name"] as? String else {
            throw DeserializationError.ImproperInputFormat
        }
        
        let ownerDetails = json["owner"] as? [String: Any?]
        let ownerAvatarUrl = ownerDetails?["avatar_url"] as? String
        
        return Repository(id: id, name: name, ownerAvatarUrl: ownerAvatarUrl)
    }
}
