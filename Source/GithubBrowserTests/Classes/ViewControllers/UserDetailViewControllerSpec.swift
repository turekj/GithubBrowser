@testable import GithubBrowser
import Nimble
import Quick
import RxBlocking
import RxSwift


class UserDetailViewControllerSpec: QuickSpec {
    
    override func spec() {
        describe("UserDetailViewController") {
            let avatarView = UIImageView()
            let usernameLabel = UILabel()
            let starCountLabel = UILabel()
            let followersLabel = UILabel()
            
            let view = UserDetailView(avatarView: avatarView,
                                      usernameLabel: usernameLabel,
                                      starCountLabel: starCountLabel,
                                      followersLabel: followersLabel)
            let detailsService = UserDetailsServiceMock()
            
            let sut = UserDetailViewController(view: view, detailsService: detailsService)
            sut.viewDidLoad()
            
            context("When user login changes") {
                it("Should bind new value to a label") {
                    sut.userLogin.value = "new_login"
                    _ = try! sut.userLogin.asDriver().toBlocking().first()
                    
                    expect(usernameLabel.text).to(equal("Username: new_login"))
                }
            }
        }
    }
}
