import Foundation
import RxSwift


protocol UserDetailsService {
    
    func getUserDetails(username: String) -> Observable<User>
}
