@testable import GithubBrowser
import Foundation
import RxSwift


class UserDetailsServiceMock: UserDetailsService {
    
    var username: String?
    var user = Observable.just(User(
        id: 18, login: "details", avatarUrl: "http://url.com", starCount: 12, followers: 45))
    
    func getUserDetails(username: String) -> Observable<User> {
        self.username = username
        
        return self.user
    }
}
