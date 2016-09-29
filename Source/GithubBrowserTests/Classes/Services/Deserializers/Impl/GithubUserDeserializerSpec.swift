@testable import GithubBrowser
import Nimble
import Quick
import Swinject


class GithubUserDeserializerSpec: QuickSpec {
    
    override func spec() {
        describe("GithubUserDeserializer") {
            let sut = GithubUserDeserializer()
            
            context("When deserializing users") {
                it("Should throw deserialization error if serialized input is not of dict type") {
                    let input = "String input"
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should throw deserialization error if user id is missing") {
                    let input = ["login": "login"] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should throw deserialization error if user login is missing") {
                    let input = ["id": 7] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should serialize users properly if data is in correct format") {
                    let input = ["id": 9, "login": "user_login",
                                 "avatar_url": "http://google.com"] as [String: Any]
                    
                    let user = try! sut.deserialize(input)
                    
                    expect(user.id).to(equal(9))
                    expect(user.login).to(equal("user_login"))
                    expect(user.avatarUrl).to(equal("http://google.com"))
                }
                
                it("Should handle optional avatar URL") {
                    let input = ["id": 9, "login": "user_login"] as [String: Any]
                    
                    let user = try! sut.deserialize(input)
                    
                    expect(user.avatarUrl).to(beNil())
                }
            }
        }
    }
}
