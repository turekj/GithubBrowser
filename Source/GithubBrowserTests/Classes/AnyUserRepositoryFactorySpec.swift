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
                    expect(result.id).to(equal(33))
                    expect(result.title).to(equal(""))
                    expect(result.imageUrl).to(equal("https://image.com"))
                    expect(result.type).to(equal(UserRepositoryEntryType.repository))
                    expect(factory.source).to(equal(15))
                }
            }
        }
    }
}
