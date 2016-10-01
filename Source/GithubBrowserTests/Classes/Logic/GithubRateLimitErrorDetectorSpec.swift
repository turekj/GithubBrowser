@testable import GithubBrowser
import Alamofire
import Nimble
import Quick


class GithubRateLimitErrorDetectorSpec: QuickSpec {
    
    override func spec() {
        describe("GithubRateLimitErrorDetector") {
            let sut = GithubRateLimitErrorDetector()
            
            context("When examining error") {
                it("Should check that error is responseValidationFailed and return false if not") {
                    let error = DeserializationError.improperInputFormat
                    
                    let result = sut.isDomainSpecificError(error: error)
                    
                    expect(result).to(beFalse())
                }
                
                it("Should check that response validation failure reason is bad status code") {
                    let error = AFError.responseValidationFailed(reason:
                        AFError.ResponseValidationFailureReason.dataFileNil)
                    
                    let result = sut.isDomainSpecificError(error: error)
                    
                    expect(result).to(beFalse())
                }
                
                it("Should check that status code is 403 and return false if not") {
                    let error = AFError.responseValidationFailed(reason:
                        AFError.ResponseValidationFailureReason.unacceptableStatusCode(code: 404))
                    
                    let result = sut.isDomainSpecificError(error: error)
                    
                    expect(result).to(beFalse())
                }
                
                it("Should return true if error is status code 403") {
                    let error = AFError.responseValidationFailed(reason:
                        AFError.ResponseValidationFailureReason.unacceptableStatusCode(code: 403))
                    
                    let result = sut.isDomainSpecificError(error: error)
                    
                    expect(result).to(beTrue())
                }
            }
        }
    }
}
