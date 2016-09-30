@testable import GithubBrowser
import UIKit


class ControllerConfiguratorMock: ControllerConfigurator {
    
    var returnValue = false
    var configuredController: UIViewController?
    var configuredWith: FlowController?
    
    func configureController(_ controller: UIViewController, with: FlowController) -> Bool {
        self.configuredController = controller
        self.configuredWith = with
        
        return self.returnValue
    }
}
