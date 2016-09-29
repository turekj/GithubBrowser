@testable import GithubBrowser
import Nimble
import Quick


class AnyDeserializerSpec: QuickSpec {
    
    override func spec() {
        describe("AnyDeserializer") {
            let deserializer = StringDeserializerMock()
            let sut = AnyDeserializer(deserializer)
            
            context("When deserializing") {
                it("Should pass deserialization invocation to wrapped object") {
                    let input = "Some input"
                    
                    let result = try! sut.deserialize(input)
                    
                    expect(result).to(equal(("Deserialized")))
                    expect(deserializer.serializedInput as? String).to(equal(input))
                }
            }
        }
    }
}
