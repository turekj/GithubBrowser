import Alamofire
import Foundation


class GithubRateLimitErrorDetector: ErrorDetector {

    func isDomainSpecificError(error: Error) -> Bool {
        guard case AFError.responseValidationFailed(reason:
            AFError.ResponseValidationFailureReason.unacceptableStatusCode(
                code: 403)) = error else {
            return false
        }
        
        return true
    }
}
