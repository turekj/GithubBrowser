@testable import GithubBrowser
import UIKit


class FlowControllerMock: FlowController {
    
    var rootController: UIViewController = ViewControllerMock()
    var selectedUserLogin: String?
    var proceededTo: AnyClass?
    var proceededAnimated: Bool?
    var revertedTo: AnyClass?
    var revertedAnimated: Bool?
    
    func proceed<ViewController : UIViewController>(to viewController: ViewController.Type,
                 animated: Bool) {
        self.proceededTo = viewController
        self.proceededAnimated = animated
    }
    
    func revert<ViewController : UIViewController>(to viewController: ViewController.Type,
                animated: Bool) {
        self.revertedTo = viewController
        self.revertedAnimated = animated
    }
}
