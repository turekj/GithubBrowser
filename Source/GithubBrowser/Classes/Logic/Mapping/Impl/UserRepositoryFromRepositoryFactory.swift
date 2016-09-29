import Foundation


class UserRepositoryFromRepositoryFactory: UserRepositoryFactory {
    
    func makeUserRepository(_ source: Repository) -> UserRepository {
        return UserRepository(
            id: source.id,
            title: source.name,
            imageUrl: source.ownerAvatarUrl,
            type: .repository)
    }
}
