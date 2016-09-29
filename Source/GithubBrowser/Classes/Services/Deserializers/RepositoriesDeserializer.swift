import Foundation


protocol RepositoriesDeserializer {
    
    func deserializeRepositories(_ serialized: Any?) throws -> [Repository]
}
