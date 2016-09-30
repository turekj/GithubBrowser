@testable import GithubBrowser
import Nimble
import OHHTTPStubs
import Quick
import RxBlocking


class GithubUserDetailsServiceSpec: QuickSpec {
    
    override func spec() {
        describe("GithubUserDetailsService") {
            let starCountService = StarCountServiceMock()
            let deserializer = SingleUserDeserializerMock()
            let sut = GithubUserDetailsService(starCountService: starCountService,
                                               deserializer: AnyDeserializer(deserializer))
            
            beforeSuite {
                _ = stub(condition: isHost("api.github.com") &&
                    isMethodGET() &&
                    isPath("/users/turekj")) { _ in
                        let stubPath = OHPathForFile("hello.json", type(of: self))
                        let headers = ["Content-Type": "application/json"] as [NSString: NSString]
                        
                        return fixture(filePath: stubPath!, headers: headers)
                }
                
                _ = stub(condition: isHost("api.github.com") &&
                    isMethodGET() &&
                    isPath("/users/failure")) { _ in
                        let stubPath = OHPathForFile("stars_count.json", type(of: self))
                        let headers = ["Content-Type": "application/json"] as [NSString: NSString]
                        
                        return fixture(filePath: stubPath!, headers: headers)
                }
            }
            
            afterSuite {
                OHHTTPStubs.removeAllStubs()
            }
            
            context("When fetching user details") {
                it("Should return an error if username is empty") {
                    let observable = sut.getUserDetails(username: "")
                    
                    expect { try observable.toBlocking().first() }.to(
                        throwError(ServiceParameterError.requiredParameterMissing))
                }
                
                it("Should throw deserialization error if response is not a dictionary") {
                    let observable = sut.getUserDetails(username: "failure")
                    
                    expect { try observable.toBlocking().first() }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should append stars count before passing JSON to deserializer") {
                    let observable = sut.getUserDetails(username: "turekj")
                    _ = try! observable.toBlocking().first()
                    let deserializerInput = deserializer.receivedInput as? [String: Any]
                    
                    expect(deserializerInput?["hello"] as? String).to(equal("world"))
                    expect(deserializerInput?["star_count"] as? Int).to(equal(10))
                }
                
                it("Should return deserialized user") {
                    let observable = sut.getUserDetails(username: "turekj")
                    let result = try! observable.toBlocking().first()
                    
                    expect(result).to(equal(deserializer.deserialized))
                }
            }
        }
    }
}
