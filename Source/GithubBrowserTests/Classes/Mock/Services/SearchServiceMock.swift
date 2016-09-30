@testable import GithubBrowser
import Foundation
import RxSwift


class SearchServiceMock: SearchService {

    var result: [String] = ["a", "b", "c"]
    var query: String?
    
    func search(withQuery query: String) -> Observable<[String]> {
        self.query = query
        
        return Observable.just(self.result)
    }
}
