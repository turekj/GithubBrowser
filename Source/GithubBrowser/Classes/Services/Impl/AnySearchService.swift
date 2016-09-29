import Foundation
import RxSwift


class AnySearchService<T>: SearchService {
    
    private let _search: ((String) -> Observable<[T]>)
    
    required init<U: SearchService>(_ searchService: U) where U.SearchedDataType == T {
        self._search = searchService.search
    }
    
    func search(withQuery query: String) -> Observable<[T]> {
        return self._search(query)
    }
}
