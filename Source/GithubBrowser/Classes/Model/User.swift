import Foundation


struct User {
    let id: Int
    let login: String
    let url: String
    let avatarUrl: String?
    let starCount: Int?
    let followers: Int?
    
    init(id: Int, login: String, url: String, avatarUrl: String? = nil,
         starCount: Int? = nil, followers: Int? = nil) {
        self.id = id
        self.login = login
        self.url = url
        self.avatarUrl = avatarUrl
        self.starCount = starCount
        self.followers = followers
    }
}
