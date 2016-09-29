import Foundation
import RxAlamofire
import RxSwift


class GithubSearchService<T>: SearchService {
    
    let deserializer: AnyDeserializer<[T]>
    let entityType: String
    
    init(deserializer: AnyDeserializer<[T]>, entityType: String) {
        self.deserializer = deserializer
        self.entityType = entityType
    }
    
    func search(withQuery query: String) -> Observable<[T]> {
        guard !query.isEmpty else {
            return Observable.just([])
        }
        
        let parameters = ["q": query as NSString]
        
        return json(.get, self.serviceUrl, parameters: parameters)
            .map({ try self.deserializer.deserialize($0) })
    }
    
    private var serviceUrl: String {
        get {
            return "https://api.github.com/search/\(self.entityType)"
        }
    }
}
