@testable import GithubBrowser
import Nimble
import Quick
import Swinject


class GithubRepositoryDeserializerSpec: QuickSpec {
    
    override func spec() {
        describe("GithubRepositoryDeserializer") {
            let sut = GithubRepositoryDeserializer()
            
            context("When deserializing repositories") {
                it("Should throw deserialization error if serialized input is not of dict type") {
                    let input = "Not a dictionary"
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.ImproperInputFormat))
                }
                
                it("Should throw deserialization error if repository id is missing") {
                    let input = ["name": "name"] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.ImproperInputFormat))
                }
                
                it("Should throw deserialization error if repository name is missing") {
                    let input = ["id": 14] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.ImproperInputFormat))
                }
                
                it("Should serialize repositories properly if data is in correct format") {
                    let input = ["id": 13, "name": "repository_name",
                                 "owner": ["avatar_url": "avatar"]] as [String: Any]
                    
                    let repository = try! sut.deserialize(input)
                    
                    expect(repository.id).to(equal(13))
                    expect(repository.name).to(equal("repository_name"))
                    expect(repository.ownerAvatarUrl).to(equal("avatar"))
                }
                
                it("Should handle optional owner info") {
                    let input = ["id": 13, "name": "repository_name"] as [String: Any]
                    
                    let repository = try! sut.deserialize(input)
                    
                    expect(repository.ownerAvatarUrl).to(beNil())
                }
                
                it("Should handle optional owner avatar") {
                    let input = ["id": 13, "name": "repository_name",
                                 "owner": ["not_an": "avatar"]] as [String: Any]
                    
                    let repository = try! sut.deserialize(input)
                    
                    expect(repository.ownerAvatarUrl).to(beNil())
                }
            }
        }
    }
}
