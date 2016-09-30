import Swinject
import UIKit


class GlobalAssembly: AssemblyType {
    
    func assemble(container: Container) {
        container.register(UIWindow.self, name: "key") { _ in
            let bounds = UIScreen.main.bounds
            let window = UIWindow(frame: bounds)
            window.backgroundColor = UIColor.white
            window.makeKeyAndVisible()
            
            return window
        }.inObjectScope(.hierarchy)
        
        container.register(UINavigationController.self, name: "root") { _ in
            return UINavigationController(nibName: nil, bundle: nil)
        }
        
        container.register(FlowController.self, name: "main") { r in
            let navigationController = r.resolve(UINavigationController.self, name: "root")!
            let configurator = r.resolve(ControllerConfigurator.self, name: "globalRoot")!
            
            return MainFlowController(resolver: container,
                                      navigationController: navigationController,
                                      configurator: configurator)
        }
        
        container.register(ControllerConfigurator.self, name: "globalRoot") { r in
            let listConfigurator = r.resolve(ControllerConfigurator.self, name: "list")!
            let detailConfigurator = r.resolve(ControllerConfigurator.self, name: "detail")!
            let configurators = [listConfigurator, detailConfigurator]
            
            return CompositeControllerConfigurator(configurators: configurators)
        }
    }
}
