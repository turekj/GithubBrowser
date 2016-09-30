@testable import GithubBrowser
import Nimble
import OHHTTPStubs
import Quick
import RxBlocking


class GithubSearchServiceSpec: QuickSpec {
    
    override func spec() {
        describe("GithubSearchService") {
            let deserializer = UsersDeserializerMock()
            let sut = GithubSearchService(deserializer: AnyDeserializer(deserializer),
                                          entityType: "fake_entity")
            
            beforeSuite {
                _ = stub(condition: isHost("api.github.com") &&
                                    isMethodGET() &&
                                    isPath("/search/fake_entity") &&
                                    containsQueryParams(["q": "to_search"])) { _ in
                        let stubPath = OHPathForFile("hello.json", type(of: self))
                        let headers = ["Content-Type": "application/json"] as [NSString: NSString]
                        
                        return fixture(filePath: stubPath!, headers: headers)
                }
            }
            
            afterSuite {
                OHHTTPStubs.removeAllStubs()
            }
            
            context("When searching") {
                beforeEach {
                    deserializer.receivedInput = nil
                }
                
                it("Should return users from deserializer") {
                    let result = try! sut.search(withQuery: "to_search").toBlocking().first()
                    
                    expect(result).toNot(beNil())
                    expect(result!.count).to(equal(1))
                    expect(result![0].id).to(equal(1))
                    expect(result![0].login).to(equal("user_log"))
                    expect(result![0].url).to(equal("http://user.com"))
                }
                
                it("Should pass fetched JSON to deserializer") {
                    _ = try! sut.search(withQuery: "to_search").toBlocking().first()
                    let json = deserializer.receivedInput as! [String: Any]
                    
                    expect(json["hello"] as? String).to(equal("world"))
                }
                
                it("Should return empty result if query is empty") {
                    let result = try! sut.search(withQuery: "").toBlocking().first()
                    
                    expect(result?.isEmpty).to(beTrue())
                }
            }
        }
    }
}
