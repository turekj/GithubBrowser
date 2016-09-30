@testable import GithubBrowser
import Nimble
import Quick


class UserSpec: QuickSpec {
    
    override func spec() {
        describe("User") {
            context("When comparing") {
                it("Should mark two users with same data as equal") {
                    let user = User(id: 5, login: "login", url: "url")
                    let otherUser = User(id: 5, login: "login", url: "url")
                    
                    let areEqual = (user == otherUser)
                    
                    expect(areEqual).to(beTrue())
                }
                
                it("Should mark users with different ids as different") {
                    let user = User(id: 7, login: "login", url: "url")
                    let otherUser = User(id: 5, login: "login", url: "url")
                    
                    let areEqual = (user == otherUser)
                    
                    expect(areEqual).to(beFalse())
                }
                
                it("Should mark users with different logins as different") {
                    let user = User(id: 5, login: "lgn", url: "url")
                    let otherUser = User(id: 5, login: "login", url: "url")
                    
                    let areEqual = (user == otherUser)
                    
                    expect(areEqual).to(beFalse())
                }
                
                it("Should mark users with different urls as different") {
                    let user = User(id: 5, login: "login", url: "url1")
                    let otherUser = User(id: 5, login: "login", url: "url")
                    
                    let areEqual = (user == otherUser)
                    
                    expect(areEqual).to(beFalse())
                }
                
                it("Should mark users with different avatars as different") {
                    let user = User(id: 5, login: "login", url: "url", avatarUrl: "asd")
                    let otherUser = User(id: 5, login: "login", url: "url", avatarUrl: nil)
                    
                    let areEqual = (user == otherUser)
                    
                    expect(areEqual).to(beFalse())
                }
                
                it("Should mark users with different star counts as different") {
                    let user = User(id: 5, login: "login", url: "url", starCount: 13)
                    let otherUser = User(id: 5, login: "login", url: "url", starCount: 40)
                    
                    let areEqual = (user == otherUser)
                    
                    expect(areEqual).to(beFalse())
                }
                
                it("Should mark users with different follower counts as different") {
                    let user = User(id: 5, login: "login", url: "url", followers: 13)
                    let otherUser = User(id: 5, login: "login", url: "url", followers: 40)
                    
                    let areEqual = (user == otherUser)
                    
                    expect(areEqual).to(beFalse())
                }
            }
        }
    }
}
