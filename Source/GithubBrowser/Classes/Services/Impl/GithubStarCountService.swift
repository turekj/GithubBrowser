import Foundation
import RxAlamofire
import RxSwift


class GithubStarCountService: StarCountService {

    func countUserStars(username: String) -> Observable<Int> {
        guard !username.isEmpty else {
            return Observable.error(ServiceParameterError.requiredParameterMissing)
        }
        
        return json(.get, self.serviceUrl(username: username))
            .map { try self.countStarredRepositories(response: $0) }
    }
    
    private func serviceUrl(username: String) -> String {
        return "https://api.github.com/users/\(username)/starred"
    }
    
    private func countStarredRepositories(response: Any) throws -> Int {
        guard let list = response as? [Any] else {
            throw DeserializationError.improperInputFormat
        }
        
        return list.count
    }
}
