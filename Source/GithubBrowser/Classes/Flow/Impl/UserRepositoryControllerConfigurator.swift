import UIKit


class UserRepositoryControllerConfigurator: ControllerConfigurator {

    func configureController(_ controller: UIViewController,
                             with flowController: FlowController) -> Bool {
        guard let list = controller as? UserRepositoryList else {
            return false
        }
        
        list.navigationBarTitle = "Github users & repos"
        list.translucentNavigationBar = false
        list.onUserRepositorySelected = { userRepository in
            guard userRepository.type == .user else {
                return
            }
            
            flowController.selectedUserId = userRepository.id
            flowController.proceed(to: UserDetailViewController.self, animated: true)
        }
        
        return true
    }
}
