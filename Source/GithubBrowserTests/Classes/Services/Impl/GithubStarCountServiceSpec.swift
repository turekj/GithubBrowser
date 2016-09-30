@testable import GithubBrowser
import Nimble
import OHHTTPStubs
import Quick
import RxBlocking


class GithubStarCountServiceSpec: QuickSpec {
    
    override func spec() {
        describe("GithubStarCountService") {
            let sut = GithubStarCountService()
            
            beforeSuite {
                _ = stub(condition: isHost("api.github.com") &&
                                    isMethodGET() &&
                                    isPath("/users/turekj/starred")) { _ in
                        let stubPath = OHPathForFile("stars_count.json", type(of: self))
                        let headers = ["Content-Type": "application/json"] as [NSString: NSString]
                        
                        return fixture(filePath: stubPath!, headers: headers)
                }
                
                _ = stub(condition: isHost("api.github.com") &&
                                    isMethodGET() &&
                                    isPath("/users/failure/starred")) { _ in
                        let stubPath = OHPathForFile("hello.json", type(of: self))
                        let headers = ["Content-Type": "application/json"] as [NSString: NSString]
                        
                        return fixture(filePath: stubPath!, headers: headers)
                }
            }
            
            afterSuite {
                OHHTTPStubs.removeAllStubs()
            }
            
            context("When counting stars") {
                it("Should return an error if username is empty") {
                    let observable = sut.countUserStars(username: "")
                    
                    expect { try observable.toBlocking().first() }.to(
                        throwError(ServiceParameterError.requiredParameterMissing))
                }
                
                it("Should throw a deserialization error if response was not an array") {
                    let observable = sut.countUserStars(username: "failure")
                    
                    expect { try observable.toBlocking().first() }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should return count of two for a stars_count.json fixture") {
                    let observable = sut.countUserStars(username: "turekj")
                    let result = try! observable.toBlocking().first()
                    
                    expect(result).to(equal(3))
                }
            }
        }
    }
}
