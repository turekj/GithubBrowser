import Foundation


class UserRepositoryFromUserFactory: UserRepositoryFactory {

    func makeUserRepository(_ source: User) -> UserRepository {
        return UserRepository(
            id: source.id,
            title: source.login,
            url: source.avatarUrl,
            type: .user)
    }
}
