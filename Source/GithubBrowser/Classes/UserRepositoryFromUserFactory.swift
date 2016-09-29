import Foundation


class UserRepositoryFromUserFactory: UserRepositoryFactory {

    func makeUserRepository(_ source: User) -> UserRepository? {
        return UserRepository(
            id: source.id,
            title: source.login,
            imageUrl: source.avatarUrl,
            type: .user)
    }
}
