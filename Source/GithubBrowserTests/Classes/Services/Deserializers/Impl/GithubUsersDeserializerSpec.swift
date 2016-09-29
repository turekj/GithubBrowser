@testable import GithubBrowser
import Nimble
import Quick
import Swinject


class GithubUsersDeserializerSpec: QuickSpec {
    
    override func spec() {
        describe("GithubUsersDeserializer") {
            let sut = GithubUsersDeserializer()
            
            context("When deserializing users") {
                it("Should throw deserialization error if serialized input is not of json type") {
                    let input = "String input"
                    
                    expect { try sut.deserializeUsers(input) }.to(
                        throwError(DeserializationError.ImproperInputFormat))
                }
                
                it("Should throw deserialization error if serialized input does not have items") {
                    let input = ["Some": "Array"] as [String: Any]
                    
                    expect { try sut.deserializeUsers(input) }.to(
                        throwError(DeserializationError.ImproperInputFormat))
                }
                
                it("Should throw deserialization error if user id is missing") {
                    let input = ["items": [
                        ["login": "login"]
                    ]] as [String: Any]
                    
                    expect { try sut.deserializeUsers(input) }.to(
                        throwError(DeserializationError.ImproperInputFormat))
                }
                
                it("Should throw deserialization error if user login is missing") {
                    let input = ["items": [
                        ["id": 7]
                    ]] as [String: Any]
                    
                    expect { try sut.deserializeUsers(input) }.to(
                        throwError(DeserializationError.ImproperInputFormat))
                }
                
                it("Should serialize users properly if data is in correct format") {
                    let input = ["items": [
                        ["id": 9, "login": "user_login", "avatar_url": "http://google.com"]
                    ]] as [String: Any]
                    
                    let users = try! sut.deserializeUsers(input)
                    
                    expect(users.count).to(equal(1))
                    expect(users[0].id).to(equal(9))
                    expect(users[0].login).to(equal("user_login"))
                    expect(users[0].avatarUrl).to(equal("http://google.com"))
                }
                
                it("Should handle optional avatar URL") {
                    let input = ["items": [
                        ["id": 9, "login": "user_login"]
                    ]] as [String: Any]
                    
                    let users = try! sut.deserializeUsers(input)
                    
                    expect(users.count).to(equal(1))
                    expect(users[0].avatarUrl).to(beNil())
                }
            }
        }
    }
}
