import UIKit


class UserRepositoryViewController: UIViewController, UserRepositoryList {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Required init
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
