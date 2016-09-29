import Cartography
import RxSwift
import UIKit


class UserRepositoryViewController: UIViewController, UserRepositoryList {
    
    let userRepositoryView: UserRepositoryView
    let userRepositoryService: AnySearchService<UserRepository>
    
    var navigationBarTitle = ""
    var translucentNavigationBar = false
    
    init(view: UserRepositoryView, userRepositoryService: AnySearchService<UserRepository>) {
        self.userRepositoryView = view
        self.userRepositoryService = userRepositoryService
        
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.bindViewModel()
    }
    
    func configureView() {
        self.view.addSubview(self.userRepositoryView)
        
        constrain(self.userRepositoryView) { v in
            v.edges == v.superview!.edges
        }
    }
    
    func bindViewModel() {
        
    }
    
    // MARK: - Layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationController?.navigationBar.isTranslucent = self.translucentNavigationBar
        self.navigationItem.title = self.navigationBarTitle
    }
    
    // MARK: - Required init
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
