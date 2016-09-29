import Swinject
import UIKit


class DetailAssembly: AssemblyType {
    
    func assemble(container: Container) {
        container.register(UserDetailViewController.self) { _ in
            return UserDetailViewController(nibName: nil, bundle: nil)
        }
        
        container.register(ControllerConfigurator.self, name: "detail") { _ in
            return UserDetailControllerConfigurator()
        }
    }
}
