@testable import GithubBrowser
import Nimble
import Quick


class UserRepositoryFromRepositoryFactorySpec: QuickSpec {
    
    override func spec() {
        describe("UserRepositoryFromRepositoryFactory") {
            let sut = UserRepositoryFromRepositoryFactory()
            
            context("When creating user repository entry") {
                let repository = Repository(id: 3, name: "oper", url: "URL")
                
                let result = sut.makeUserRepository(repository)
                
                it("Should rewrite id field") {
                    expect(result.id).to(equal(3))
                }
                
                it("Should rewrite name to title") {
                    expect(result.title).to(equal("oper"))
                }
                
                it("Should rewrite url field") {
                    expect(result.url).to(equal("URL"))
                }
                
                it("Should set type to repository") {
                    expect(result.type).to(equal(UserRepositoryEntryType.repository))
                }
            }
        }
    }
}
