import UIKit


class UINavigationControllerMock: UINavigationController {
 
    var lastPushed: UIViewController?
    var lastPushedAnimated: Bool?
    var lastPoppedTo: UIViewController?
    var lastPoppedToAnimated: Bool?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.lastPushed = viewController
        self.lastPushedAnimated = animated
    }
    
    override func popToViewController(_ viewController: UIViewController,
                                      animated: Bool) -> [UIViewController]? {
        self.lastPoppedTo = viewController
        self.lastPoppedToAnimated = animated
        
        return nil
    }
}
