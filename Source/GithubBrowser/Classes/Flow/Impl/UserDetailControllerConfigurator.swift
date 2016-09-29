import UIKit


class UserDetailControllerConfigurator: ControllerConfigurator {
    
    func configureController(_ controller: UIViewController,
                             with flowController: FlowController) -> Bool {
        guard let detail = controller as? UserDetail else {
            return false
        }
        
        detail.userId = flowController.selectedUserId
        
        return true
    }
}
