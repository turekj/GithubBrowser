@testable import GithubBrowser
import Nimble
import OHHTTPStubs
import Quick
import RxBlocking


class GithubRepositoriesServiceSpec: QuickSpec {
    
    override func spec() {
        describe("GithubRepositoriesService") {
            let deserializer = RepositoriesDeserializerMock()
            let sut = GithubRepositoriesService(deserializer: AnyDeserializer(deserializer))
            
            beforeSuite {
                _ = stub(condition: isHost("api.github.com") &&
                                    isMethodGET() &&
                                    isPath("/search/repositories") &&
                                    containsQueryParams(["q": "repo_to_find"])) { _ in
                        let stubPath = OHPathForFile("hello.json", type(of: self))
                        let headers = ["Content-Type": "application/json"] as [NSString: NSString]
                        
                        return fixture(filePath: stubPath!, headers: headers)
                }
            }
            
            afterSuite {
                OHHTTPStubs.removeAllStubs()
            }
            
            context("When searching for repositories") {
                it("Should return repository from deserializer") {
                    let result = try! sut.searchRepositories(withQuery: "repo_to_find")
                        .toBlocking()
                        .first()
                    
                    expect(result).toNot(beNil())
                    expect(result!.count).to(equal(1))
                    expect(result![0].id).to(equal(1))
                    expect(result![0].name).to(equal("repo"))
                    expect(result![0].ownerAvatarUrl).to(beNil())
                }
                
                it("Should pass service JSON to serializer") {
                    _ = try! sut.searchRepositories(withQuery: "repo_to_find").toBlocking().first()
                    let json = deserializer.receivedInput as! [String: Any]
                    
                    expect(json["hello"] as? String).to(equal("world"))
                }
                
                it("Should return empty result if query is empty") {
                    let result = try! sut.searchRepositories(withQuery: "").toBlocking().first()
                    
                    expect(result?.isEmpty).to(beTrue())
                }
            }
        }
    }
}
