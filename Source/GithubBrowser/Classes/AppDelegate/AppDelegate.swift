import Swinject
import UIKit


class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var assembler: Assembler = self.createAssembler()
    
    private func createAssembler() -> Assembler {
        let assemblies = [GlobalAssembly(), ListAssembly()] as [AssemblyType]
        
        return try! Assembler(assemblies: assemblies)
    }
    
    // MARK: - Application starting point

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.initializeKeyWindow()
        
        return true
    }
    
    func initializeKeyWindow() {
        self.window = self.assembler.resolver.resolve(UIWindow.self, name: "key")
    }
}
