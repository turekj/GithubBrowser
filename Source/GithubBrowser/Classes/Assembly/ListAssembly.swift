import Swinject
import UIKit


class ListAssembly: AssemblyType {
    
    func assemble(container: Container) {
        container.register(ControllerConfigurator.self, name: "list") { _ in
            return UserRepositoryControllerConfigurator()
        }
        
        container.register(UserRepositoryViewController.self) { r in
            let view = r.resolve(UserRepositoryView.self)!
            
            return UserRepositoryViewController(view: view)
        }
        
        container.register(UserRepositoryView.self) { _ in
            let searchField = UITextField()
            searchField.autocapitalizationType = .none
            searchField.autocorrectionType = .no
            searchField.placeholder = "Search query"
            
            let list = UITableView()
            
            return UserRepositoryView(searchField: searchField, list: list)
        }
    }
}
