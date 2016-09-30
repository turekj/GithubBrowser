@testable import GithubBrowser
import Nimble
import Quick
import RxBlocking


class AnySearchServiceSpec: QuickSpec {
    
    override func spec() {
        describe("AnySearchService") {
            let searchService = SearchServiceMock()
            let sut = AnySearchService(searchService)
            
            context("When deserializing") {
                it("Should pass search invocation to wrapped object") {
                    let query = "x'; DROP TABLE users; SELECT '1"
                    
                    let result = try! sut.search(withQuery: query).toBlocking().first()!
                    
                    expect(result).toNot(beNil())
                    expect(result.count).to(equal(3))
                    expect(result[0]).to(equal("a"))
                    expect(result[1]).to(equal("b"))
                    expect(result[2]).to(equal("c"))
                    expect(searchService.query).to(equal(query))
                }
            }
        }
    }
}
