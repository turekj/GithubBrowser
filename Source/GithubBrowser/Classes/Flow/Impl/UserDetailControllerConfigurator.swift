import UIKit


class UserDetailControllerConfigurator: ControllerConfigurator {
    
    func configureController(_ controller: UIViewController,
                             with flowController: FlowController) -> Bool {
        guard let _ = controller as? UserDetail else {
            return false
        }
        
        return true
    }
}
