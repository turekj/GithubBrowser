import Foundation
import RxSwift


protocol UsersService {
    
    func searchUsers(withQuery query: String) -> Observable<[User]>
}
