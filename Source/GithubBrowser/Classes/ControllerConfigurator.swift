import UIKit


protocol ControllerConfigurator {
    
    func configureController(_ controller: UIViewController, with: FlowController) -> Bool
}
