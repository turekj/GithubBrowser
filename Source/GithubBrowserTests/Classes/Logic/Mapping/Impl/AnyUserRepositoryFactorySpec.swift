@testable import GithubBrowser
import Nimble
import Quick


class AnyUserRepositoryFactorySpec: QuickSpec {
    
    override func spec() {
        describe("AnyUserRepositoryFactory") {
            let factory = UserRepositoryFromIntFactoryMock()
            let sut = AnyUserRepositoryFactory(factory)
            
            context("When creating user repository") {
                let result = sut.makeUserRepository(15)
                
                it("Should pass make invocation to wrapped object") {
                    expect(result).to(equal(factory.userRepository))
                    expect(factory.source).to(equal(15))
                }
            }
        }
    }
}
