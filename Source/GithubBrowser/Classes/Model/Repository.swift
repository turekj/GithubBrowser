import Foundation


struct Repository {
    let id: Int
    let name: String
    let ownerAvatarUrl: String?
    
    init(id: Int, name: String, ownerAvatarUrl: String?) {
        self.id = id
        self.name = name
        self.ownerAvatarUrl = ownerAvatarUrl
    }
}
