@testable import GithubBrowser
import Foundation


class UsersDeserializerMock: Deserializer {
    
    var receivedInput: Any?
    var deserializedUsers: [User] = [
        User(id: 1, login: "user_log", url: "http://user.com")
    ]
    
    func deserialize(_ serialized: Any?) throws -> [User] {
        self.receivedInput = serialized
        
        return self.deserializedUsers
    }
}
