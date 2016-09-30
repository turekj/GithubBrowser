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
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should throw deserialization error if repository id is missing") {
                    let input = ["name": "name", "url": "repo_url"] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should throw deserialization error if repository name is missing") {
                    let input = ["id": 14, "url": "repo_url"] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should throw deserialization error if repository url is missing") {
                    let input = ["id": 11, "name": "repo"] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should serialize repositories properly if data is in correct format") {
                    let input = ["id": 13, "name": "repository_name",
                                 "url": "repo_url"] as [String: Any]
                    
                    let repository = try! sut.deserialize(input)
                    
                    expect(repository.id).to(equal(13))
                    expect(repository.name).to(equal("repository_name"))
                    expect(repository.url).to(equal("repo_url"))
                }
            }
        }
    }
}
