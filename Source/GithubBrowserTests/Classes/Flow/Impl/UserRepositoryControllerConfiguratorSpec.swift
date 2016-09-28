@testable import GithubBrowser
import Nimble
import Quick
import Swinject


class UserRepositoryControllerConfiguratorSpec: QuickSpec {
    
    override func spec() {
        describe("UserRepositoryControllerConfigurator") {
            let sut = UserRepositoryControllerConfigurator()
            
            context("When configuring view controller") {
                let flowController = FlowControllerMock()
                
                it("Should return true if instance of UserRepositoryList is given") {
                    let controller = UserRepositoryListMock()
                    
                    let result = sut.configureController(controller, with: flowController)
                    
                    expect(result).to(beTrue())
                }
                
                it("Should return false if not a UserRepositoryList instance is given") {
                    let controller = ViewControllerMock()
                    
                    let result = sut.configureController(controller, with: flowController)
                    
                    expect(result).to(beFalse())
                }
            }
        }
    }
}
