@testable import GithubBrowser
import Foundation


class UserRepositoryFromIntFactoryMock: UserRepositoryFactory {
    
    var source: Int?
    var userRepository = UserRepository(id: 33, title: "", url: "https://image.com",
                                        type: .repository)
    
    func makeUserRepository(_ source: Int) -> UserRepository {
        self.source = source
    
        return self.userRepository
    }
}
