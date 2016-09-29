@testable import GithubBrowser
import Nimble
import Quick
import Swinject


class UserRepositoryControllerConfiguratorSpec: QuickSpec {
    
    override func spec() {
        describe("UserRepositoryControllerConfigurator") {
            let flowController = FlowControllerMock()
            let sut = UserRepositoryControllerConfigurator()
            
            context("When configuring controller that conforms to UserRepositoryList") {
                let controller = UserRepositoryListMock()
                
                beforeEach {
                    controller.navigationBarTitle = ""
                    controller.translucentNavigationBar = true
                }
                
                it("Should return true") {
                    let result = sut.configureController(controller, with: flowController)
                    
                    expect(result).to(beTrue())
                }
                
                it("Should set translucent navigation bar property to false") {
                    _ = sut.configureController(controller, with: flowController)
                    
                    expect(controller.translucentNavigationBar).to(beFalse())
                }
                
                it("Should set navigation bar title") {
                    _ = sut.configureController(controller, with: flowController)
                    
                    expect(controller.navigationBarTitle).to(equal("Github users & repos"))
                }
            }
            
            context("When configuring controller that doesn't conform to UserRepositoryList") {
                let controller = ViewControllerMock()
             
                it("Should return false") {
                    let result = sut.configureController(controller, with: flowController)
                    
                    expect(result).to(beFalse())
                }
            }
        }
    }
}
