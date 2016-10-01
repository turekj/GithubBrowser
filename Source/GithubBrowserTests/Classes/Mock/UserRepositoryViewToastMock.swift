@testable import GithubBrowser
import UIKit


class UserRepositoryViewToastMock: UserRepositoryView {
    
    var toastMessage: String?
    
    public override func presentToast(_ message: String) {
        self.toastMessage = message
    }
}
