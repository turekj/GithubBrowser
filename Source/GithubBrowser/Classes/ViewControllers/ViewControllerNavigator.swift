import UIKit


protocol ViewControllerNavigator {

    func navigateForward<ViewController: UIViewController>(
        viewController: ViewController.Type, animated: Bool)
    
    func navigateBack<ViewController: UIViewController>(
        viewController: ViewController.Type, animated: Bool)
}
