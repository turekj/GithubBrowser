import Foundation


class AnyDeserializer<T>: Deserializer {
    
    private let _deserialize: ((Any?) throws -> T)
    
    required init<U: Deserializer>(_ deserializer: U) where U.DeserializedDataType == T {
        self._deserialize = deserializer.deserialize
    }
    
    func deserialize(_ serialized: Any?) throws -> T {
        return try self._deserialize(serialized)
    }
}
