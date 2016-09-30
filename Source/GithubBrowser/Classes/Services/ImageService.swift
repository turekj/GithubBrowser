import RxSwift
import UIKit


protocol ImageService {

    func image(fromUrl: String) -> Observable<UIImage>
}
