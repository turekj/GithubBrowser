import Swinject
import UIKit


class MainFlowController: FlowController {
    
    let resolver: ResolverType
    let navigationController: UINavigationController
    
    init(resolver: ResolverType, navigationController: UINavigationController) {
        self.resolver = resolver
        self.navigationController = navigationController
    }
    
    var rootController: UIViewController {
        get {
            return self.navigationController
        }
    }
    
    func proceed<ViewController: UIViewController>(to viewController: ViewController.Type,
                 animated: Bool) {
        guard let controller = self.resolver.resolve(viewController) as? UIViewController else {
            return
        }
        
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func revert<ViewController: UIViewController>(to viewController: ViewController.Type,
                animated: Bool) {
        self.navigationController.navigateBack(to: viewController, animated: animated)
    }
}
