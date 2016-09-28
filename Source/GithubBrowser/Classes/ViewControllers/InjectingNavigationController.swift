import UIKit


class InjectingNavigationController: ViewControllerNavigator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateForward<ViewController : UIViewController>(
        viewController: ViewController.Type, animated: Bool) {
        
    }
    
    func navigateBack<ViewController : UIViewController>(
        viewController: ViewController.Type, animated: Bool) {
        
    }
}
