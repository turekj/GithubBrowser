import UIKit


protocol FlowController: class {
    
    var rootController: UIViewController { get }
    var selectedUserLogin: String? { get set }
    
    func proceed<ViewController: UIViewController>(to viewController: ViewController.Type,
                 animated: Bool)
    func revert<ViewController: UIViewController>(to viewController: ViewController.Type,
                animated: Bool)
}
