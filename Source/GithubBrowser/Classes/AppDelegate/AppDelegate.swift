import Swinject
import UIKit


class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var assembler: Assembler = self.createAssembler()
    lazy var flowController: FlowController = self.createFlowController()
    
    private func createAssembler() -> Assembler {
        let assemblies = [DetailAssembly(), GlobalAssembly(),
                          ListAssembly(), ServiceAssembly()] as [AssemblyType]
        
        return try! Assembler(assemblies: assemblies)
    }
    
    private func createFlowController() -> FlowController {
        return self.assembler.resolver.resolve(FlowController.self, name: "main")!
    }
    
    // MARK: - Application starting point

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.initializeKeyWindow()
        self.initializeApplicationFlow()
        
        return true
    }
    
    func initializeKeyWindow() {
        self.window = self.assembler.resolver.resolve(UIWindow.self, name: "key")
        self.window?.rootViewController = self.flowController.rootController
    }
    
    func initializeApplicationFlow() {
        self.flowController.proceed(to: UserRepositoryViewController.self, animated: false)
    }
}
