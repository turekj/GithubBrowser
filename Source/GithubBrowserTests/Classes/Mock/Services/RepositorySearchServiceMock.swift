@testable import GithubBrowser
import Foundation
import RxSwift


class RepositorySearchServiceMock: SearchService {
    
    var users = [Repository(id: 10, name: "repo", ownerAvatarUrl: "ownerAvatarUrl")]
    var query: String?
    
    func search(withQuery query: String) -> Observable<[Repository]> {
        self.query = query
        
        return Observable.just(users)
    }
}
