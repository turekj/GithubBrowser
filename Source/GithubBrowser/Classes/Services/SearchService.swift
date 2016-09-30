import Foundation
import RxSwift


protocol SearchService {
    
    associatedtype SearchedDataType
    
    func search(withQuery query: String) -> Observable<[SearchedDataType]>
}
