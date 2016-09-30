@testable import GithubBrowser
import RxSwift
import UIKit


class UserDetailMock: UIViewController, UserDetail {
    
    var userLogin: Variable<String?> = Variable(nil)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
