import Foundation
import RxAlamofire
import RxSwift


class GithubUsersService: UsersService {
    
    let deserializer: UsersDeserializer
    
    init(deserializer: UsersDeserializer) {
        self.deserializer = deserializer
    }
    
    func searchUsers(withQuery query: String) -> Observable<[User]> {
        guard !query.isEmpty else {
            return Observable.just([])
        }
        
        let url = "https://api.github.com/search/users"
        let parameters = ["q": query as NSString]
        
        return json(.get, url, parameters: parameters)
            .map({ try self.deserializer.deserializeUsers($0) })
    }
}
