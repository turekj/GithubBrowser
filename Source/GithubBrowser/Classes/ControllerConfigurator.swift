import UIKit


protocol ControllerConfigurator {
    
    func configureController(_ controller: UIViewController,
                             with flowController: FlowController) -> Bool
}
