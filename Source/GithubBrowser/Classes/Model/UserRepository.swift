import Foundation


struct UserRepository {
    
    let id: Int
    let title: String
    let imageUrl: String?
    let type: UserRepositoryEntryType
    
    init(id: Int, title: String, imageUrl: String?, type: UserRepositoryEntryType) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.type = type
    }
}
