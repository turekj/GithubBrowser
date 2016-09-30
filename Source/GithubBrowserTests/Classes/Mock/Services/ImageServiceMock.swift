@testable import GithubBrowser
import RxSwift
import UIKit


class ImageServiceMock: ImageService {
    
    var url: String?
    var image = UIImage(named: "avatar.jpg", in: Bundle(for: ImageServiceMock.self),
                        compatibleWith: nil)
    var error: Error?
    
    func image(fromUrl url: String) -> Observable<UIImage> {
        self.url = url
        
        if let error = self.error {
            return Observable.error(error)
        }
        else {
            return Observable.just(self.image!)
        }
    }
}
