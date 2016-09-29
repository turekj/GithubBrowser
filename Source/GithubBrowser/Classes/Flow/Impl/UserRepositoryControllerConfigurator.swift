import UIKit


class UserRepositoryControllerConfigurator: ControllerConfigurator {

    func configureController(_ controller: UIViewController,
                             with flowController: FlowController) -> Bool {
        guard let list = controller as? UserRepositoryList else {
            return false
        }
        
        list.navigationBarTitle = "Github users & repos"
        list.translucentNavigationBar = false
        
        return true
    }
}
