@testable import GithubBrowser
import Nimble
import Quick
import Swinject


class CompositeControllerConfiguratorSpec: QuickSpec {
    
    override func spec() {
        describe("CompositeControllerConfigurator") {
            let viewController = ViewControllerMock()
            let flowController = FlowControllerMock()
            
            let firstConfigurator = ControllerConfiguratorMock()
            let secondConfigurator = ControllerConfiguratorMock()
            let sut = CompositeControllerConfigurator(
                configurators: [firstConfigurator, secondConfigurator])
            
            beforeEach {
                firstConfigurator.configuredController = nil
                firstConfigurator.configuredWith = nil
                secondConfigurator.configuredController = nil
                secondConfigurator.configuredWith = nil
            }
            
            it("Should return true if any configurators returns true") {
                firstConfigurator.returnValue = false
                secondConfigurator.returnValue = true
                
                let result = sut.configureController(viewController, with: flowController)
                
                expect(result).to(beTrue())
            }
            
            it("Should return false if all of the configurators return false") {
                firstConfigurator.returnValue = false
                secondConfigurator.returnValue = false
                
                let result = sut.configureController(viewController, with: flowController)
                
                expect(result).to(beFalse())
            }
            
            it("Should pass details to child configurator") {
                firstConfigurator.returnValue = false
                secondConfigurator.returnValue = false
                
                _ = sut.configureController(viewController, with: flowController)
                
                expect(firstConfigurator.configuredController).to(be(viewController))
                expect(firstConfigurator.configuredWith).to(be(flowController))
                expect(secondConfigurator.configuredController).to(be(viewController))
                expect(secondConfigurator.configuredWith).to(be(flowController))
            }
            
            it("Should not make subsequent calls if any configurator succeeds") {
                firstConfigurator.returnValue = true
                secondConfigurator.returnValue = true
                
                _ = sut.configureController(viewController, with: flowController)
                
                expect(secondConfigurator.configuredController).to(beNil())
                expect(secondConfigurator.configuredWith).to(beNil())
            }
        }
    }
}
