@testable import GithubBrowser
import Foundation
import RxSwift


class UserRepositorySearchServiceMock: SearchService {

    var query: String?
    var searchResult: Observable<[UserRepository]> = Observable.just([])
    
    func search(withQuery query: String) -> Observable<[UserRepository]> {
        self.query = query
        
        return self.searchResult
    }
}
