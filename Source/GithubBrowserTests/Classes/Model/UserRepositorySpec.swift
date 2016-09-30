@testable import GithubBrowser
import Nimble
import Quick


class UserRepositorySpec: QuickSpec {
    
    override func spec() {
        describe("UserRepository") {
            context("When comparing") {
                it("Should mark two user-repositories with same data as equal") {
                    let userRepository = UserRepository(id: 78, title: "title",
                                                        url: "rl", type: .user)
                    let otherUserRepository = UserRepository(id: 78, title: "title",
                                                             url: "rl", type: .user)
                    
                    let areEqual = (userRepository == otherUserRepository)
                    
                    expect(areEqual).to(beTrue())
                }
                
                it("Should mark two user-repositories with different ids as different") {
                    let userRepository = UserRepository(id: 12, title: "title",
                                                        url: "rl", type: .user)
                    let otherUserRepository = UserRepository(id: 78, title: "title",
                                                             url: "rl", type: .user)
                    
                    let areEqual = (userRepository == otherUserRepository)
                    
                    expect(areEqual).to(beFalse())
                }
                
                it("Should mark two user-repositories with different titles as different") {
                    let userRepository = UserRepository(id: 78, title: "title",
                                                        url: "rl", type: .user)
                    let otherUserRepository = UserRepository(id: 78, title: "titleXYZ",
                                                             url: "rl", type: .user)
                    
                    let areEqual = (userRepository == otherUserRepository)
                    
                    expect(areEqual).to(beFalse())
                }
                
                it("Should mark two user-repositories with different urls as different") {
                    let userRepository = UserRepository(id: 78, title: "title",
                                                        url: "URL", type: .user)
                    let otherUserRepository = UserRepository(id: 78, title: "title",
                                                             url: "rl", type: .user)
                    
                    let areEqual = (userRepository == otherUserRepository)
                    
                    expect(areEqual).to(beFalse())
                }
                
                it("Should mark two user-repositories with different types as different") {
                    let userRepository = UserRepository(id: 78, title: "title",
                                                        url: "rl", type: .user)
                    let otherUserRepository = UserRepository(id: 78, title: "title",
                                                             url: "rl", type: .repository)
                    
                    let areEqual = (userRepository == otherUserRepository)
                    
                    expect(areEqual).to(beFalse())
                }
            }
        }
    }
}
