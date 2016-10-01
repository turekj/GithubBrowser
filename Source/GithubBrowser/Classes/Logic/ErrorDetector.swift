import Foundation


protocol ErrorDetector {
    
    func isDomainSpecificError(error: Error) -> Bool
}
