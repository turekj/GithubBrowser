@testable import GithubBrowser
import Foundation


class UserRepositoryFromIntFactoryMock: UserRepositoryFactory {
    
    var source: Int?
    
    func makeUserRepository(_ source: Int) -> UserRepository? {
        self.source = source
        
        return UserRepository(id: 33, title: "", imageUrl: "https://image.com", type: .repository)
    }
}
