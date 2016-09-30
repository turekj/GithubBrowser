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
                
                it("Should bind user data to service results") {
                    sut.userLogin.value = "a_login"
                    let result = try! sut.userData?.toBlocking().first()
                    
                    expect(detailsService.username).to(equal("a_login"))
                    expect(result?.id).to(equal(detailsService.user.id))
                    expect(result?.login).to(equal(detailsService.user.login))
                    expect(result?.avatarUrl).to(equal(detailsService.user.avatarUrl))
                    expect(result?.followers).to(equal(detailsService.user.followers))
                    expect(result?.starCount).to(equal(detailsService.user.starCount))
                }
                
                it("Should bind followers count to a label") {
                    sut.userLogin.value = "login"
                    _ = try! sut.userData?.toBlocking().first()
                    
                    expect(followersLabel.text).to(equal("Followers count: 45"))
                }
                
                it("Should bind stars count to a label") {
                    sut.userLogin.value = "lg"
                    _ = try! sut.userData?.toBlocking().first()
                    
                    expect(starCountLabel.text).to(equal("Stars count: 12"))
                }
            }
        }
    }
}
