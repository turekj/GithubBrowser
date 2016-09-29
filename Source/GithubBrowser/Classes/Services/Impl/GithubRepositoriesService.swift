import Foundation
import RxAlamofire
import RxSwift


class GithubRepositoriesService: RepositoriesService {
    
    let deserializer: AnyDeserializer<[Repository]>
    
    init(deserializer: AnyDeserializer<[Repository]>) {
        self.deserializer = deserializer
    }
    
    func searchRepositories(withQuery query: String) -> Observable<[Repository]> {
        guard !query.isEmpty else {
            return Observable.just([])
        }
        
        let url = "https://api.github.com/search/repositories"
        let parameters = ["q": query as NSString]
        
        return json(.get, url, parameters: parameters)
            .map({ try self.deserializer.deserialize($0) })
    }
}
