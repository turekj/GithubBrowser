@testable import GithubBrowser
import Nimble
import Quick


class GithubSearchItemsDeserializerSpec: QuickSpec {
    
    override func spec() {
        describe("GithubSearchItemsDeserializer") {
            let deserializer = StringDeserializerMock()
            let sut = GithubSearchItemsDeserializer(
                itemDeserializer: AnyDeserializer(deserializer))
            
            context("When deserializing search items") {
                it("Should throw deserialization error if serialized input is not of json type") {
                    let input = "String input"
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should throw deserialization error if serialized input does not have items") {
                    let input = ["Some": "Array"] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should throw deserialization error if items are not an array") {
                    let input = ["items": "not valid items"] as [String: Any]
                    
                    expect { try sut.deserialize(input) }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
                
                it("Should return items deserialized by item deserializer") {
                    let input = ["items": [["first": "item"]]] as [String: Any]
                    
                    let result = try! sut.deserialize(input)
                    let deserializerInput = deserializer.serializedInput as? [String: Any]
                    
                    expect(result.count).to(equal(1))
                    expect(result[0]).to(equal("Deserialized"))
                    expect(deserializerInput?["first"] as? String).to(equal("item"))
                }
            }
        }
    }
}
