@testable import GithubBrowser
import UIKit


class UserRepositoryListMock: UIViewController, UserRepositoryList {
    
    var onUserRepositorySelected: ((UserRepository) -> Void)?
    
    var navigationBarTitle = ""
    var translucentNavigationBar = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
