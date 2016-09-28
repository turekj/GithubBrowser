@testable import GithubBrowser
import Nimble
import Quick
import Swinject


class MainFlowControllerSpec: QuickSpec {
    
    override func spec() {
        describe("MainFlowController") {
            let container = Container() { c in
                c.register(ViewControllerMock.self) { _ in
                    ViewControllerMock(nibName: nil, bundle: nil)
                }
                c.register(OtherViewControllerMock.self) { _ in
                    OtherViewControllerMock(nibName: nil, bundle: nil)
                }
            }
            
            let navigationController = UINavigationControllerMock(nibName: nil, bundle: nil)
            let sut = MainFlowController(resolver: container,
                                         navigationController: navigationController)
            
            it("Should return navigation controller as root controller") {
                let rootController = sut.rootController
                
                expect(rootController).to(be(navigationController))
            }
            
            context("When proceeding") {
                beforeEach {
                    navigationController.lastPushed = nil
                    navigationController.lastPushedAnimated = nil
                }
                
                it("Should push resolved view controller on stack") {
                    sut.proceed(to: OtherViewControllerMock.self, animated: false)
                    
                    expect(navigationController.lastPushed).to(
                        beAKindOf(OtherViewControllerMock.self))
                    expect(navigationController.lastPushedAnimated).to(beTrue())
                }
                
                it("Should do nothing if a controller could not be resolved") {
                    sut.proceed(to: YetAnotherViewControllerMock.self, animated: true)
                    
                    expect(navigationController.lastPushed).to(beNil())
                    expect(navigationController.lastPushedAnimated).to(beNil())
                }
            }
            
            context("When navigating backward") {
                let viewController = ViewControllerMock(nibName: nil, bundle: nil)
                navigationController.viewControllers = [viewController]
                
                beforeEach {
                    navigationController.lastPoppedTo = nil
                    navigationController.lastPoppedToAnimated = nil
                }
                
                it("Should pop to last present view controller") {
                    sut.revert(to: ViewControllerMock.self, animated: false)
                    
                    expect(navigationController.lastPoppedTo).to(be(viewController))
                    expect(navigationController.lastPoppedToAnimated).to(beFalse())
                }
            }
        }
    }
}
