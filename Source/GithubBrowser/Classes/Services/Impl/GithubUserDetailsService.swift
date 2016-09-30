import Foundation
import RxAlamofire
import RxSwift


class GithubUserDetailsService: UserDetailsService {
    
    let starCountService: StarCountService
    let deserializer: AnyDeserializer<User>
    
    init(starCountService: StarCountService, deserializer: AnyDeserializer<User>) {
        self.starCountService = starCountService
        self.deserializer = deserializer
    }
    
    func getUserDetails(username: String) -> Observable<User> {
        guard !username.isEmpty else {
            return Observable.error(ServiceParameterError.requiredParameterMissing)
        }
        
        let userDetails = json(.get, self.serviceUrl(username: username))
        let starCount = self.starCountService.countUserStars(username: username)
        
        return Observable.combineLatest(userDetails, starCount) {
            try self.appendStarCountToDetails(userDetails: $0, starCount: $1)
        }
        .map { try self.deserializer.deserialize($0) }
    }
    
    private func serviceUrl(username: String) -> String {
        return "https://api.github.com/users/\(username)"
    }
    
    private func appendStarCountToDetails(userDetails: Any, starCount: Int) throws -> Any {
        guard var details = userDetails as? [String: Any] else {
            throw DeserializationError.improperInputFormat
        }
        
        details.updateValue(starCount, forKey: "star_count")
        return details
    }
}
