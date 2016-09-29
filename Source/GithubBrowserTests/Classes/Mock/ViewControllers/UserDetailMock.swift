@testable import GithubBrowser
import UIKit


class UserDetailMock: UIViewController, UserDetail {
    
    var userId: Int?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
