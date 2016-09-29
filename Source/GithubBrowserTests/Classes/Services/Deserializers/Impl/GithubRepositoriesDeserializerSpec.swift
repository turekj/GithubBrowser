@testable import GithubBrowser
import Nimble
import Quick
import Swinject


class GithubRepositoriesDeserializerSpec: QuickSpec {
    
    override func spec() {
        describe("GithubRepositoriesDeserializer") {
            let sut = GithubRepositoriesDeserializer()
            
            context("When deserializing repositories") {
                it("Should throw deserialization error if serialized input is not of json type") {
                    let input = "Not a JSON"
                    
                    expect { try sut.deserializeRepositories(input) }.to(
                        throwError(DeserializationError.ImproperInputFormat))
                }
                
                it("Should throw deserialization error if serialized input does not have items") {
                    let input = ["No": "Items"] as [String: Any]
                    
                    expect { try sut.deserializeRepositories(input) }.to(
                        throwError(DeserializationError.ImproperInputFormat))
                }
                
                it("Should throw deserialization error if repository id is missing") {
                    let input = ["items": [
                        ["name": "name"]
                    ]] as [String: Any]
                    
                    expect { try sut.deserializeRepositories(input) }.to(
                        throwError(DeserializationError.ImproperInputFormat))
                }
                
                it("Should throw deserialization error if repository name is missing") {
                    let input = ["items": [
                        ["id": 14]
                    ]] as [String: Any]
                    
                    expect { try sut.deserializeRepositories(input) }.to(
                        throwError(DeserializationError.ImproperInputFormat))
                }
                
                it("Should serialize repositories properly if data is in correct format") {
                    let input = ["items": [
                        ["id": 13, "name": "repository_name", "owner": ["avatar_url": "avatar"]]
                    ]] as [String: Any]
                    
                    let repositories = try! sut.deserializeRepositories(input)
                    
                    expect(repositories.count).to(equal(1))
                    expect(repositories[0].id).to(equal(13))
                    expect(repositories[0].name).to(equal("repository_name"))
                    expect(repositories[0].ownerAvatarUrl).to(equal("avatar"))
                }
            }
        }
    }
}
