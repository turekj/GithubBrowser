import RxAlamofire
import RxSwift
import UIKit


class DownloadImageService: ImageService {
    
    func image(fromUrl url: String) -> Observable<UIImage> {
        return data(.get, url)
            .map {
                guard let image = UIImage(data: $0) else {
                    throw DeserializationError.improperInputFormat
                }
                
                return image
            }
    }
}
