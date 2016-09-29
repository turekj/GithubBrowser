import Foundation


protocol UserRepositoryFactory {

    associatedtype SourceDataType
    
    func makeUserRepository(_ source: SourceDataType) -> UserRepository?
}
