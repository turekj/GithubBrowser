import Foundation
import RxSwift


protocol UserDetail: class {

    var userLogin: Variable<String?> { get set }
}
