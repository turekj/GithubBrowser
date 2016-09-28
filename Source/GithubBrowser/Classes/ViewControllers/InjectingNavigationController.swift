import Swinject
import UIKit


class InjectingNavigationController: ViewControllerNavigator {
    
    let resolver: ResolverType
    let navigationController: UINavigationController
    
    init(resolver: ResolverType, navigationController: UINavigationController) {
        self.resolver = resolver
        self.navigationController = navigationController
    }
    
    func navigateForward<ViewController : UIViewController>(to viewController: ViewController.Type,
                         animated: Bool) {        
        guard let controller = self.resolver.resolve(viewController) as? UIViewController else {
            return
        }
        
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func navigateBack<ViewController : UIViewController>(
            to viewController: ViewController.Type, animated: Bool) {
        for controller in self.navigationController.viewControllers.reversed() {
            if controller.isKind(of: viewController) {
                self.navigationController.popToViewController(controller, animated: animated)
                return
            }
        }
    }
}
