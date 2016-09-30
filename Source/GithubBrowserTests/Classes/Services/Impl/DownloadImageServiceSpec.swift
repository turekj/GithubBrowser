@testable import GithubBrowser
import Nimble
import OHHTTPStubs
import Quick
import RxBlocking


class DownloadImageServiceSpec: QuickSpec {
    
    override func spec() {
        describe("DownloadImageService") {
            let sut = DownloadImageService()
            
            beforeSuite {
                _ = stub(condition: isHost("valid.host") &&
                                    isMethodGET()) { _ in
                        let bundle = Bundle(for: DownloadImageServiceSpec.self)
                        let path = bundle.path(forResource: "avatar", ofType: "jpg")!
                        let url = URL(fileURLWithPath: path)
                        let data = try! Data(contentsOf: url)
                        let headers = ["Content-Type": "image/jpeg"] as [NSString: NSString]
                        
                        return OHHTTPStubsResponse(data: data, statusCode: 200, headers: headers)
                }
                
                _ = stub(condition: isHost("invalid.host") &&
                                    isMethodGET()) { _ in
                        let data = "Hello world!".data(using: String.Encoding.utf8)!
                        let headers = ["Content-Type": "image/jpeg"] as [NSString: NSString]
                        
                        return OHHTTPStubsResponse(data: data, statusCode: 200, headers: headers)
                }
            }
            
            afterSuite {
                OHHTTPStubs.removeAllStubs()
            }
            
            context("When downloading image") {
                it("Should return requested image") {
                    let url = "https://valid.host/avatar.jpg"
                    
                    let result = try! sut.image(fromUrl: url).toBlocking().first()
                    
                    expect(result).toNot(beNil())
                    expect(result?.size.width).to(equal(460))
                    expect(result?.size.height).to(equal(460))
                }
                
                it("Should throw an error in case JPEG image is not valid") {
                    let url = "https://invalid.host/avatar.jpg"
                    
                    expect { try sut.image(fromUrl: url).toBlocking().first() }.to(
                        throwError(DeserializationError.improperInputFormat))
                }
            }
        }
    }
}
