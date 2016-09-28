@testable import GithubBrowser
import Nimble
import Quick
import Swinject


class InjectingNavigationControllerSpec: QuickSpec {
    
    override func spec() {
        describe("InjectingNavigationController") {
            let container = Container() { c in
                c.register(ViewControllerMock.self) { _ in
                    ViewControllerMock(nibName: nil, bundle: nil)
                }
                c.register(OtherViewControllerMock.self) { _ in
                    OtherViewControllerMock(nibName: nil, bundle: nil)
                }
            }
            
            let navigationController = UINavigationControllerMock(nibName: nil, bundle: nil)
            let sut = InjectingNavigationController(
                resolver: container, navigationController: navigationController)
            
            context("When navigating forward") {
                beforeEach {
                    navigationController.lastPushed = nil
                    navigationController.lastPushedAnimated = nil
                }
                
                it("Should push resolved view controller on stack") {
                    sut.navigateForward(to: OtherViewControllerMock.self, animated: false)
                    
                    expect(navigationController.lastPushed).to(
                        beAKindOf(OtherViewControllerMock.self))
                    expect(navigationController.lastPushedAnimated).to(beTrue())
                }
                
                it("Should do nothing if a controller could not be resolved") {
                    sut.navigateForward(to: YetAnotherViewControllerMock.self, animated: true)
                    
                    expect(navigationController.lastPushed).to(beNil())
                    expect(navigationController.lastPushedAnimated).to(beNil())
                }
            }
            
            context("When navigating backward") {
                let first = ViewControllerMock(nibName: nil, bundle: nil)
                let second = OtherViewControllerMock(nibName: nil, bundle: nil)
                let third = ViewControllerMock(nibName: nil, bundle: nil)
                let fourth = OtherViewControllerMock(nibName: nil, bundle: nil)
                navigationController.setViewControllers([first, second, third, fourth],
                                                        animated: false)
                
                beforeEach {
                    navigationController.lastPoppedTo = nil
                    navigationController.lastPoppedToAnimated = nil
                }
                
                it("Should pop to last present view controller of class on stack if present") {
                    sut.navigateBack(to: ViewControllerMock.self, animated: false)
                    
                    expect(navigationController.lastPoppedTo).to(be(third))
                    expect(navigationController.lastPoppedToAnimated).to(beFalse())
                }
                
                it("Should not do anything if view controller of class not present") {
                    sut.navigateBack(to: YetAnotherViewControllerMock.self, animated: true)
                    
                    expect(navigationController.lastPoppedTo).to(beNil())
                    expect(navigationController.lastPoppedToAnimated).to(beNil())
                }
            }
        }
    }
}
