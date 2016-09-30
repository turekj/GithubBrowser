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
                    let input = ["login": "login", "url": "url"] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should throw deserialization error if user login is missing") {
                    let input = ["id": 7, "url": "url"] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should throw deserialization error if url is missing") {
                    let input = ["id": 13, "login": "lgn"] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should serialize required user properies") {
                    let input = ["id": 9, "login": "user_login", "url": "someUrl"] as [String: Any]
                    
                    let user = try! sut.deserialize(input)
                    
                    expect(user.id).to(equal(9))
                    expect(user.login).to(equal("user_login"))
                    expect(user.url).to(equal("someUrl"))
                    expect(user.avatarUrl).to(beNil())
                    expect(user.followers).to(beNil())
                    expect(user.starCount).to(beNil())
                }
                                
                it("Should set avatar URL if present") {
                    let input = ["id": 735, "login": "av",
                                 "url": "url", "avatar_url": "AvatarUrl"] as [String: Any]
                    
                    let user = try! sut.deserialize(input)
                    
                    expect(user.avatarUrl).to(equal("AvatarUrl"))
                }
                
                it("Should set star count if present") {
                    let input = ["id": 44, "login": "sc",
                                 "url": "url", "star_count": 33] as [String: Any]
                    
                    let user = try! sut.deserialize(input)
                    
                    expect(user.starCount).to(equal(33))
                }
                
                it("Should set followers count if present") {
                    let input = ["id": 22, "url": "url",
                                 "login": "flwrs", "followers": 99] as [String: Any]
                    
                    let user = try! sut.deserialize(input)
                    
                    expect(user.followers).to(equal(99))
                }
            }
        }
    }
}
