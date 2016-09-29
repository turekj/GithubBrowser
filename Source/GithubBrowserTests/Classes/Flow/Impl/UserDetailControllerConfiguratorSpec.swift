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
