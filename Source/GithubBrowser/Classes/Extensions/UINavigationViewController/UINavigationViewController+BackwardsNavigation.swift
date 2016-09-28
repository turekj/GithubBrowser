import Dollar
import UIKit


extension UINavigationController {
    
    func navigateBack<ViewController: UIViewController>(to viewController: ViewController.Type,
                      animated: Bool) {
        guard let controller = self.findControllerOnStack(controller: viewController) else {
            return
        }
        
        self.popToViewController(controller, animated: animated)
    }
    
    func findControllerOnStack<ViewController: UIViewController>(
            controller: ViewController.Type) -> UIViewController? {
        return $.find(self.viewControllers.reversed()) { $0.isKind(of: controller) }
    }
}
