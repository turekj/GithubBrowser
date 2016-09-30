@testable import GithubBrowser
import Foundation
import RxSwift


class UserSearchServiceMock: SearchService {
    
    var users = [User(id: 1, login: "name", url: "avatarUrl")]
    var query: String?
    
    func search(withQuery query: String) -> Observable<[User]> {
        self.query = query
        
        return Observable.just(users)
    }
}
