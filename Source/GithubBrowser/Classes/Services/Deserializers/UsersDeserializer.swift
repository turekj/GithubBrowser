import Foundation


protocol UsersDeserializer {

    func deserializeUsers(_ serialized: Any?) throws -> [User]
}
