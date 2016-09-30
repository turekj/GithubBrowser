@testable import GithubBrowser
import Nimble
import Quick


class RepositorySpec: QuickSpec {
    
    override func spec() {
        describe("Repository") {
            context("When comparing") {
                it("Should mark two repositories with same data as equal") {
                    let repository = Repository(id: 4, name: "asd", url: "url")
                    let otherRepository = Repository(id: 4, name: "asd", url: "url")
                    
                    let areEqual = (repository == otherRepository)
                    
                    expect(areEqual).to(beTrue())
                }
                
                it("Should mark two repositories with different ids as different") {
                    let repository = Repository(id: 2, name: "asd", url: "url")
                    let otherRepository = Repository(id: 4, name: "asd", url: "url")
                    
                    let areEqual = (repository == otherRepository)
                    
                    expect(areEqual).to(beFalse())
                }
                
                it("Should mark two repositories with different names as different") {
                    let repository = Repository(id: 4, name: "some_name", url: "url")
                    let otherRepository = Repository(id: 4, name: "asd", url: "url")
                    
                    let areEqual = (repository == otherRepository)
                    
                    expect(areEqual).to(beFalse())
                }
                
                it("Should mark two repositories with different urls as different") {
                    let repository = Repository(id: 4, name: "asd", url: "url_different")
                    let otherRepository = Repository(id: 4, name: "asd", url: "url")
                    
                    let areEqual = (repository == otherRepository)
                    
                    expect(areEqual).to(beFalse())
                }
            }
        }
    }
}
