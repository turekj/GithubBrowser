import Foundation


struct User {
    let id: Int
    let login: String
    let avatarUrl: String?
    let starCount: Int?
    let followers: Int?
    
    init(id: Int, login: String, avatarUrl: String?, starCount: Int? = nil,
         followers: Int? = nil) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
        self.starCount = starCount
        self.followers = followers
    }
}
