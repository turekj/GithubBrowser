import Foundation


struct User {
    let id: Int
    let login: String
    let avatarUrl: String?
    
    init(id: Int, login: String, avatarUrl: String?) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }
}
