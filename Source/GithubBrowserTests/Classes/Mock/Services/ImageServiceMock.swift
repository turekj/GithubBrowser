@testable import GithubBrowser
import RxSwift
import UIKit


class ImageServiceMock: ImageService {
    
    var url: String?
    var image = UIImage(named: "avatar.jpg", in: Bundle(for: ImageServiceMock.self),
                        compatibleWith: nil)
    
    func image(fromUrl url: String) -> Observable<UIImage> {
        self.url = url
        
        return Observable.just(self.image!)
    }
}
