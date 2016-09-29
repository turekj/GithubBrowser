@testable import GithubBrowser
import Nimble
import Quick


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
                
                it("Should set on cell select action") {
                    _ = sut.configureController(controller, with: flowController)
                    
                    expect(controller.onUserRepositorySelected).toNot(beNil())
                }
            }
            
            context("When configuring controller that doesn't conform to UserRepositoryList") {
                let controller = ViewControllerMock()
             
                it("Should return false") {
                    let result = sut.configureController(controller, with: flowController)
                    
                    expect(result).to(beFalse())
                }
            }
            
            context("When configuring cell select action") {
                let controller = UserRepositoryListMock()
                _ = sut.configureController(controller, with: flowController)
                
                beforeEach {
                    flowController.proceededTo = nil
                    flowController.proceededAnimated = nil
                }
                
                it("Should not navigate to details view controller if not a user") {
                    let repo = UserRepository(id: 1, title: "", imageUrl: nil, type: .repository)
                    
                    controller.onUserRepositorySelected?(repo)
                    
                    expect(flowController.proceededTo).to(beNil())
                    expect(flowController.proceededAnimated).to(beNil())
                }
                
                it("Should navigate to details view controller if it is a user") {
                    let user = UserRepository(id: 1, title: "", imageUrl: nil, type: .user)
                    
                    controller.onUserRepositorySelected?(user)
                    
                    expect(flowController.proceededTo).to(be(UserDetailViewController.self))
                    expect(flowController.proceededAnimated).to(beTrue())
                }
            }
        }
    }
}
