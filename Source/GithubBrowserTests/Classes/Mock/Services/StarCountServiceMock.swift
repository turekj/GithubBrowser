@testable import GithubBrowser
import Foundation
import RxSwift


class StarCountServiceMock: StarCountService {
    
    var username: String?
    var result = 10
    
    func countUserStars(username: String) -> Observable<Int> {
        self.username = username
        
        return Observable.just(self.result)
    }
}
