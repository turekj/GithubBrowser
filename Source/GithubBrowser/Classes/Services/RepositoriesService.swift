import Foundation
import RxSwift


protocol RepositoriesService {
    
    func searchRepositories(withQuery query: String) -> Observable<[Repository]>
}
