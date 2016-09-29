@testable import GithubBrowser
import Nimble
import Quick
import RxBlocking


class UserRepositorySearchServiceSpec: QuickSpec {
    
    override func spec() {
        describe("UserRepositorySearchService") {
            let userSearchService = UserSearchServiceMock()
            let repositorySearchService = RepositorySearchServiceMock()
            let urFromUserFactory = UserRepositoryFromUserFactory()
            let urFromRepoFactory = UserRepositoryFromRepositoryFactory()
            
            let sut = UserRepositorySearchService(
                userSearchService: AnySearchService(userSearchService),
                repositorySearchService: AnySearchService(repositorySearchService),
                userRepositoryFromUserFactory: AnyUserRepositoryFactory(urFromUserFactory),
                userRepositoryFromRepositoryFactory: AnyUserRepositoryFactory(urFromRepoFactory))
            
            context("When searching for user repositories") {
                it("Should combine latest results from user service and repository service") {
                    let result = try! sut.search(withQuery: "qr").toBlocking().first()
                    
                    expect(result).toNot(beNil())
                    expect(result?.count).to(equal(2))
                    expect(result?[0].id).to(equal(1))
                    expect(result?[1].id).to(equal(10))
                }
            }
        }
    }
}
