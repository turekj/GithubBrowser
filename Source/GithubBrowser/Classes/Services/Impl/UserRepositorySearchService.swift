import Foundation
import RxSwift


class UserRepositorySearchService: SearchService {

    let userSearchService: AnySearchService<User>
    let repositorySearchService: AnySearchService<Repository>
    let userRepositoryFromUserFactory: AnyUserRepositoryFactory<User>
    let userRepositoryFromRepositoryFactory: AnyUserRepositoryFactory<Repository>
    
    init(userSearchService: AnySearchService<User>,
         repositorySearchService: AnySearchService<Repository>,
         userRepositoryFromUserFactory: AnyUserRepositoryFactory<User>,
         userRepositoryFromRepositoryFactory: AnyUserRepositoryFactory<Repository>) {
        self.userSearchService = userSearchService
        self.repositorySearchService = repositorySearchService
        self.userRepositoryFromUserFactory = userRepositoryFromUserFactory
        self.userRepositoryFromRepositoryFactory = userRepositoryFromRepositoryFactory
    }
    
    func search(withQuery query: String) -> Observable<[UserRepository]> {
        let users = self.userSearchService
            .search(withQuery: query)
            .map { $0.map(self.userRepositoryFromUserFactory.makeUserRepository) }
        let repositories = self.repositorySearchService
            .search(withQuery: query)
            .map { $0.map(self.userRepositoryFromRepositoryFactory.makeUserRepository) }
        
        return Observable.combineLatest(users, repositories) { $0 + $1 }
    }
}
