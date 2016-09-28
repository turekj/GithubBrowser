@testable import GithubBrowser
import Nimble
import Quick



class UINavigationViewControllerBackwardsNavigationSpec: QuickSpec {
    
    override func spec() {
        describe("UINavigationViewController") {
            let first = ViewControllerMock(nibName: nil, bundle: nil)
            let second = OtherViewControllerMock(nibName: nil, bundle: nil)
            let third = ViewControllerMock(nibName: nil, bundle: nil)
            let fourth = OtherViewControllerMock(nibName: nil, bundle: nil)
            let sut = UINavigationControllerMock(nibName: nil, bundle: nil)
            sut.setViewControllers([first, second, third, fourth], animated: false)
            
            context("When navigating back to a controller of class") {
                beforeEach {
                    sut.lastPoppedTo = nil
                    sut.lastPoppedToAnimated = nil
                }
                
                it("Should pop to last present view controller of class on stack if present") {
                    sut.navigateBack(to: ViewControllerMock.self, animated: false)
                    
                    expect(sut.lastPoppedTo).to(be(third))
                    expect(sut.lastPoppedToAnimated).to(beFalse())
                }
                
                it("Should not do anything if view controller of class not present") {
                    sut.navigateBack(to: YetAnotherViewControllerMock.self, animated: true)
                    
                    expect(sut.lastPoppedTo).to(beNil())
                    expect(sut.lastPoppedToAnimated).to(beNil())
                }
            }
        }
    }
}
