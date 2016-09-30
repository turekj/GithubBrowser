import Foundation


struct UserRepository: Equatable {
    
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


func ==(lhs: UserRepository, rhs: UserRepository) -> Bool {
    return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.url == rhs.url &&
        lhs.type == rhs.type
}
