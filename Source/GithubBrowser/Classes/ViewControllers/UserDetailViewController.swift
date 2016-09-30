import Cartography
import RxSwift
import UIKit


class UserDetailViewController: UIViewController, UserDetail {
    
    let userDetailView: UserDetailView
    let detailsService: UserDetailsService
    
    var userLogin: Variable<String?> = Variable(nil)
    var userData: Observable<User>?
    let disposeBag = DisposeBag()
    
    init(view: UserDetailView, detailsService: UserDetailsService) {
        self.userDetailView = view
        self.detailsService = detailsService
        
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.bindViewModel()
    }
    
    func configureView() {
        self.view.addSubview(self.userDetailView)
        
        constrain(self.userDetailView) { v in
            v.edges == v.superview!.edges
        }
    }
    
    func bindViewModel() {
        self.userLogin.asDriver()
            .filter { $0 != nil }
            .map { "Username: \($0!)" }
            .drive(self.userDetailView.usernameLabel.rx.text)
            .addDisposableTo(self.disposeBag)
        
        self.userData = self.userLogin.asObservable()
            .filter { $0 != nil }
            .flatMapLatest { (login: String?) -> Observable<User> in
                self.detailsService.getUserDetails(username: login!)
            }
            .observeOn(MainScheduler.instance)
            .shareReplay(1)
        
        self.userData?
            .filter { $0.followers != nil }
            .map { "Followers count: \($0.followers!)" }
            .asDriver(onErrorJustReturn: "Followers count: n/a")
            .drive(self.userDetailView.followersLabel.rx.text)
            .addDisposableTo(self.disposeBag)
        
        self.userData?
            .filter { $0.starCount != nil }
            .map { "Stars count: \($0.starCount!)" }
            .asDriver(onErrorJustReturn: "Stars count: n/a")
            .drive(self.userDetailView.starCountLabel.rx.text)
            .addDisposableTo(self.disposeBag)
    }
    
    // MARK: - Layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationItem.title = self.userLogin.value
    }
    
    // MARK: - Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
