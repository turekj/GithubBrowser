import Foundation
import Swinject


class ListAssembly: AssemblyType {
    
    func assemble(container: Container) {
        container.register(ControllerConfigurator.self, name: "list") { _ in
            return UserRepositoryControllerConfigurator()
        }
        
        container.register(UserRepositoryViewController.self) { _ in
            return UserRepositoryViewController()
        }
    }
}
