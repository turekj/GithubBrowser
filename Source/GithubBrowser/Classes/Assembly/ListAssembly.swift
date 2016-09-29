import Swinject
import UIKit


class ListAssembly: AssemblyType {
    
    func assemble(container: Container) {
        container.register(ControllerConfigurator.self, name: "list") { _ in
            return UserRepositoryControllerConfigurator()
        }
        
        container.register(UserRepositoryViewController.self) { r in
            let view = r.resolve(UserRepositoryView.self)!
            let service = r.resolve(AnySearchService<UserRepository>.self)!
            
            return UserRepositoryViewController(view: view, userRepositoryService: service)
        }
        
        container.register(UserRepositoryView.self) { _ in
            let searchBar = UISearchBar()
            searchBar.autocapitalizationType = .none
            searchBar.autocorrectionType = .no
            searchBar.placeholder = "Search query"
            
            let list = UITableView()
            
            return UserRepositoryView(searchBar: searchBar, list: list)
        }
    }
}
