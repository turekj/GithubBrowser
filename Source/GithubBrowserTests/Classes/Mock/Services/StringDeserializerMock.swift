@testable import GithubBrowser
import Foundation


class StringDeserializerMock: Deserializer {
    
    var deserialized = "Deserialized"
    var serializedInput: Any?
    
    func deserialize(_ serialized: Any?) throws -> String {
        self.serializedInput = serialized
        
        return self.deserialized
    }
}
