import Foundation
import RxSwift


protocol StarCountService {

    func countUserStars(username: String) -> Observable<Int>
}
