import Cartography
import RxSwift
import UIKit


class UserDetailViewController: UIViewController, UserDetail {
    
    let userDetailView: UserDetailView
    let detailsService: UserDetailsService
    
    var userLogin: Variable<String?> = Variable(nil)
    
    init(view: UserDetailView, detailsService: UserDetailsService) {
        self.userDetailView = view
        self.detailsService = detailsService
        
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
