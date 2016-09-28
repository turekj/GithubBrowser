import UIKit


protocol ViewControllerNavigator {

    func navigateForward<ViewController: UIViewController>(
        to viewController: ViewController.Type, animated: Bool)
    
    func navigateBack<ViewController: UIViewController>(
        to viewController: ViewController.Type, animated: Bool)
}
