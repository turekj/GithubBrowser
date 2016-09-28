import UIKit


protocol FlowController {
    
    var rootController: UIViewController { get }
    
    
    func proceed<ViewController: UIViewController>(to viewController: ViewController.Type,
                 animated: Bool)
    func revert<ViewController: UIViewController>(to viewController: ViewController.Type,
                animated: Bool)
}
