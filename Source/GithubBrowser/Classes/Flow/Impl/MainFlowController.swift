import Swinject
import UIKit


class MainFlowController: FlowController {
    
    let resolver: ResolverType
    let navigationController: UINavigationController
    let configurator: ControllerConfigurator
    
    var selectedUserLogin: String?
    
    init(resolver: ResolverType, navigationController: UINavigationController,
         configurator: ControllerConfigurator) {
        self.resolver = resolver
        self.navigationController = navigationController
        self.configurator = configurator
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
        
        _ = self.configurator.configureController(controller, with: self)
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func revert<ViewController: UIViewController>(to viewController: ViewController.Type,
                animated: Bool) {
        self.navigationController.navigateBack(to: viewController, animated: animated)
    }
}
