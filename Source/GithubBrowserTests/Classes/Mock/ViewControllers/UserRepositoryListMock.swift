@testable import GithubBrowser
import UIKit


class UserRepositoryListMock: UIViewController, UserRepositoryList {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
