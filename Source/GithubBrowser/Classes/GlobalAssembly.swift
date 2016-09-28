import Swinject
import UIKit


class GlobalAssembly: AssemblyType {
    
    func assemble(container: Container) {
        container.register(UIWindow.self, name: "key") { _ in
            let bounds = UIScreen.main.bounds
            let window = UIWindow(frame: bounds)
            window.backgroundColor = UIColor.white
            window.makeKeyAndVisible()
            
            return window
        }.inObjectScope(.hierarchy)
    }
}
