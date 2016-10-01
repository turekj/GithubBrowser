@testable import GithubBrowser
import Foundation


class ErrorDetectorMock: ErrorDetector {
    
    var returnValue = false
    
    func isDomainSpecificError(error: Error) -> Bool {
        return self.returnValue
    }
}
