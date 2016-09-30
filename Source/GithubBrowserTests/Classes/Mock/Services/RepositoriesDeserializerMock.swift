@testable import GithubBrowser
import Foundation


class RepositoriesDeserializerMock: Deserializer {
    
    var receivedInput: Any?
    var deserializedRepositories: [Repository] = [
        Repository(id: 1, name: "repo", url: "repo_url")
    ]
    
    func deserialize(_ serialized: Any?) throws -> [Repository] {
        self.receivedInput = serialized
        
        return self.deserializedRepositories
    }
}
