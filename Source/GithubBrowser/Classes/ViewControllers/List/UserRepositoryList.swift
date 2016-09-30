import Foundation


protocol UserRepositoryList: class {
    
    var onUserRepositorySelected: ((UserRepository) -> Void)? { get set }
    
    var navigationBarTitle: String { get set }
    var translucentNavigationBar: Bool { get set }
}
