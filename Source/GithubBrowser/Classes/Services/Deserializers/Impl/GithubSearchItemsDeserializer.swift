import Foundation


class GithubSearchItemsDeserializer<T>: Deserializer {

    let itemDeserializer: AnyDeserializer<T>
    
    init(itemDeserializer: AnyDeserializer<T>) {
        self.itemDeserializer = itemDeserializer
    }
    
    func deserialize(_ serialized: Any?) throws -> [T] {
        guard let json = serialized as? [String: Any?] else {
            throw DeserializationError.ImproperInputFormat
        }
        
        guard let items = json["items"] as? [Any?] else {
            throw DeserializationError.ImproperInputFormat
        }
        
        return try items.map { try self.itemDeserializer.deserialize($0) }
    }
}
