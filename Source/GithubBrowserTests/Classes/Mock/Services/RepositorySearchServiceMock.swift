@testable import GithubBrowser
import Foundation
import RxSwift


class RepositorySearchServiceMock: SearchService {
    
    var repositories = [Repository(id: 10, name: "repo", url: "repoUrl")]
    var query: String?
    
    func search(withQuery query: String) -> Observable<[Repository]> {
        self.query = query
        
        return Observable.just(self.repositories)
    }
}
