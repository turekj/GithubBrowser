import Foundation


protocol Deserializer {
    
    associatedtype DeserializedDataType
    
    func deserialize(_ serialized: Any?) throws -> DeserializedDataType
}
