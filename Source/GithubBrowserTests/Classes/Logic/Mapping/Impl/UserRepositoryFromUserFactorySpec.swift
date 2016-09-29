@testable import GithubBrowser
import Nimble
import Quick


class UserRepositoryFromUserFactorySpec: QuickSpec {
    
    override func spec() {
        describe("UserRepositoryFromUserFactory") {
            let sut = UserRepositoryFromUserFactory()
            
            context("When creating user repository entry") {
                let user = User(id: 19, login: "usr_lgn", avatarUrl: "https://url.com")
                
                let result = sut.makeUserRepository(user)
                
                it("Should rewrite id field") {
                    expect(result.id).to(equal(19))
                }
                
                it("Should rewrite login to title") {
                    expect(result.title).to(equal("usr_lgn"))
                }
                
                it("Should rewrite avatarUrl to imageUrl") {
                    expect(result.imageUrl).to(equal("https://url.com"))
                }
                
                it("Should set type to user") {
                    expect(result.type).to(equal(UserRepositoryEntryType.user))
                }
            }
        }
    }
}
