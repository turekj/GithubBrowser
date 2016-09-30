@testable import GithubBrowser
import Foundation


class SingleUserDeserializerMock: Deserializer {
    
    var receivedInput: Any?
    var deserialized = User(id: 678, login: "creative_login", avatarUrl: "http://nullpointer.com")
    
    func deserialize(_ serialized: Any?) throws -> User {
        self.receivedInput = serialized
        
        return self.deserialized
    }
}
