@testable import GithubBrowser
import Nimble
import OHHTTPStubs
import Quick
import RxBlocking


class GithubUsersServiceSpec: QuickSpec {
    
    override func spec() {
        describe("GithubUsersService") {
            let deserializer = UsersDeserializerMock()
            let sut = GithubUsersService(deserializer: deserializer)
            
            beforeSuite {
                _ = stub(condition: isHost("api.github.com") &&
                                    isMethodGET() &&
                                    isPath("/search/users") &&
                                    containsQueryParams(["q": "to_search"])) { _ in
                    let stubPath = OHPathForFile("hello.json", type(of: self))
                    let headers = ["Content-Type": "application/json"] as [NSString: NSString]
                    
                    return fixture(filePath: stubPath!, headers: headers)
                }
            }
            
            afterSuite {
                OHHTTPStubs.removeAllStubs()
            }
            
            context("When searching for users") {
                it("Should return users from deserializer") {
                    let result = try! sut.searchUsers(withQuery: "to_search").toBlocking().first()
                    
                    expect(result).toNot(beNil())
                    expect(result!.count).to(equal(1))
                    expect(result![0].id).to(equal(1))
                    expect(result![0].login).to(equal("user_log"))
                    expect(result![0].avatarUrl).to(equal("http://avatar.com"))
                }
                
                it("Should pass service JSON to serializer") {
                    _ = try! sut.searchUsers(withQuery: "to_search").toBlocking().first()
                    let json = deserializer.receivedInput as! [String: Any]
                    
                    expect(json["hello"] as? String).to(equal("world"))
                }
                
                it("Should return empty result if query is empty") {
                    let result = try! sut.searchUsers(withQuery: "").toBlocking().first()
                    
                    expect(result?.isEmpty).to(beTrue())
                }
            }
        }
    }
}
