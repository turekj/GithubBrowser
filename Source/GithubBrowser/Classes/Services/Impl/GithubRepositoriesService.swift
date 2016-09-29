import Foundation
import RxAlamofire
import RxSwift


class GithubRepositoriesService: RepositoriesService {
    
    let deserializer: RepositoriesDeserializer
    
    init(deserializer: RepositoriesDeserializer) {
        self.deserializer = deserializer
    }
    
    func searchRepositories(withQuery query: String) -> Observable<[Repository]> {
        guard !query.isEmpty else {
            return Observable.just([])
        }
        
        let url = "https://api.github.com/search/repositories"
        let parameters = ["q": query as NSString]
        
        return json(.get, url, parameters: parameters)
            .map({ try self.deserializer.deserializeRepositories($0) })
    }
}
