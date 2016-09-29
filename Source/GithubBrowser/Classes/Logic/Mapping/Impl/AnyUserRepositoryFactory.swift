import Foundation


class AnyUserRepositoryFactory<T>: UserRepositoryFactory {
    
    private let _factory: ((T) -> UserRepository)
    
    required init<U: UserRepositoryFactory>(_ factory: U) where U.SourceDataType == T {
        self._factory = factory.makeUserRepository
    }
    
    func makeUserRepository(_ source: T) -> UserRepository {
        return self._factory(source)
    }
}
