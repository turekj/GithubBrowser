import Foundation


struct UserRepository {
    
    let id: Int
    let title: String
    let url: String
    let type: UserRepositoryEntryType
    
    init(id: Int, title: String, url: String, type: UserRepositoryEntryType) {
        self.id = id
        self.title = title
        self.url = url
        self.type = type
    }
}
