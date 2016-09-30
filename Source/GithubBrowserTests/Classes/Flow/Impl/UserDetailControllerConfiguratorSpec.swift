@testable import GithubBrowser
import Nimble
import Quick


class UserDetailControllerConfiguratorSpec: QuickSpec {
    
    override func spec() {
        describe("UserDetailControllerConfigurator") {
            let flowController = FlowControllerMock()
            let sut = UserDetailControllerConfigurator()
            
            context("When configuring controller that conforms to UserDetail") {
                let controller = UserDetailMock()
                
                it("Should return true") {
                    let result = sut.configureController(controller, with: flowController)
                    
                    expect(result).to(beTrue())
                }
                
                it("Should pass selected user login value") {
                    flowController.selectedUserLogin = "selected_user_login"
                    
                    _ = sut.configureController(controller, with: flowController)
                    
                    expect(controller.userLogin.value).to(equal("selected_user_login"))
                }
            }
            
            context("When configuring controller that doesn't conform to UserDetail") {
                let controller = ViewControllerMock()
                
                it("Should return false") {
                    let result = sut.configureController(controller, with: flowController)
                    
                    expect(result).to(beFalse())
                }
            }
        }
    }
}
