import Cartography
import UIKit


class UserDetailViewController: UIViewController, UserDetail {
    
    let userDetailView: UserDetailView
    
    var userId: Int?
    
    init(view: UserDetailView) {
        self.userDetailView = view
        
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    func configureView() {
        self.view.addSubview(self.userDetailView)
        
        constrain(self.userDetailView) { v in
            v.edges == v.superview!.edges
        }
    }
    
    // MARK: - Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
