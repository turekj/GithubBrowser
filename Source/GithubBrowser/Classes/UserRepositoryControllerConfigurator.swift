import UIKit


class UserRepositoryControllerConfigurator: ControllerConfigurator {

    func configureController(_ controller: UIViewController,
                             with flowController: FlowController) -> Bool {
        guard let _ = controller as? UserRepositoryList else {
            return false
        }
        
        return true
    }
}
