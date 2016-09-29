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
                
                it("Should pass selected user ID value") {
                    flowController.selectedUserId = 73
                    
                    _ = sut.configureController(controller, with: flowController)
                    
                    expect(controller.userId).to(equal(73))
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
