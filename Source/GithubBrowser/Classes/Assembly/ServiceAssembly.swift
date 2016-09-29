import Swinject
import UIKit


class ServiceAssembly: AssemblyType {
    
    func assemble(container: Container) {
        container.register(AnySearchService<UserRepository>.self) { r in
            let userSearchService = r.resolve(AnySearchService<User>.self)!
            let repositorySearchService = r.resolve(AnySearchService<Repository>.self)!
            let urFromUserFactory = r.resolve(AnyUserRepositoryFactory<User>.self)!
            let urFromRepositoryFactory = r.resolve(AnyUserRepositoryFactory<Repository>.self)!
            
            return AnySearchService(UserRepositorySearchService(
                userSearchService: userSearchService,
                repositorySearchService: repositorySearchService,
                userRepositoryFromUserFactory: urFromUserFactory,
                userRepositoryFromRepositoryFactory: urFromRepositoryFactory))
        }
        
        container.register(AnySearchService<User>.self) { r in
            let deserializer = r.resolve(AnyDeserializer<[User]>.self)!
            let entityType = "users"
            
            return AnySearchService(GithubSearchService(deserializer: deserializer,
                                                        entityType: entityType))
        }
        
        container.register(AnyDeserializer<[User]>.self) { r in
            let userDeserializer = r.resolve(AnyDeserializer<User>.self)!
            
            return AnyDeserializer(GithubSearchItemsDeserializer(
                itemDeserializer: userDeserializer))
        }
        
        container.register(AnyDeserializer<User>.self) { _ in
            return AnyDeserializer(GithubUserDeserializer())
        }
        
        container.register(AnySearchService<Repository>.self) { r in
            let deserializer = r.resolve(AnyDeserializer<[Repository]>.self)!
            let entityType = "repositories"
            
            return AnySearchService(GithubSearchService(deserializer: deserializer,
                                                        entityType: entityType))
        }
        
        container.register(AnyDeserializer<[Repository]>.self) { r in
            let repositoryDeserializer = r.resolve(AnyDeserializer<Repository>.self)!
            
            return AnyDeserializer(GithubSearchItemsDeserializer(
                itemDeserializer: repositoryDeserializer))
        }
        
        container.register(AnyDeserializer<Repository>.self) { _ in
            return AnyDeserializer(GithubRepositoryDeserializer())
        }
        
        container.register(AnyUserRepositoryFactory<User>.self) { _ in
            return AnyUserRepositoryFactory(UserRepositoryFromUserFactory())
        }
        
        container.register(AnyUserRepositoryFactory<Repository>.self) { _ in
            return AnyUserRepositoryFactory(UserRepositoryFromRepositoryFactory())
        }
    }
}
