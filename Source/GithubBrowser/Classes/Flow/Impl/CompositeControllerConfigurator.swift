import Dollar
import UIKit


class CompositeControllerConfigurator: ControllerConfigurator {

    let configurators: [ControllerConfigurator]
    
    init(configurators: [ControllerConfigurator]) {
        self.configurators = configurators
    }
    
    func configureController(_ controller: UIViewController,
                             with flowController: FlowController) -> Bool {
        return $.find(self.configurators) {
            $0.configureController(controller, with: flowController)
        } != nil
    }
}
