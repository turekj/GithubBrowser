import UIKit


extension UINavigationController {
    
    func navigateBack<ViewController: UIViewController>(to viewController: ViewController.Type,
                      animated: Bool) {
        for controller in self.viewControllers.reversed() {
            if controller.isKind(of: viewController) {
                self.popToViewController(controller, animated: animated)
                return
            }
        }
    }
}
