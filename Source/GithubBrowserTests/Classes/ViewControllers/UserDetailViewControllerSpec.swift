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
            let imageService = ImageServiceMock()
            
            let sut = UserDetailViewController(view: view, detailsService: detailsService,
                                               imageService: imageService)
            sut.viewDidLoad()
            
            context("When user login changes") {
                beforeEach {
                    avatarView.image = nil
                }
                
                it("Should bind new value to a label") {
                    sut.userLogin.value = "new_login"
                    _ = try! sut.userLogin.asDriver().toBlocking().first()
                    
                    expect(usernameLabel.text).to(equal("Username: new_login"))
                }
                
                it("Should bind user data to service results") {
                    sut.userLogin.value = "a_login"
                    let result = try! sut.userData?.toBlocking().first()
                    
                    expect(detailsService.username).to(equal("a_login"))
                    expect(result).to(equal(detailsService.user))
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
                
                it("Should map avatar URL to image and bind it to avatar view") {
                    sut.userLogin.value = "loginlogin"
                    _ = try! sut.userData?.toBlocking().first()
                    
                    expect(avatarView.image).toEventuallyNot(beNil(), timeout: 3)
                    expect(avatarView.image?.size.width).toEventually(equal(460), timeout: 3)
                    expect(avatarView.image?.size.height).toEventually(equal(460), timeout: 3)
                    expect(imageService.url).to(equal("http://url.com"))
                }
                
                it("Should use a placeholder image on error") {
                    imageService.error = ServiceParameterError.requiredParameterMissing
                    sut.userLogin.value = "tttt"
                    _ = try! sut.userData?.toBlocking().first()
                    
                    expect(avatarView.image).toEventuallyNot(beNil(), timeout: 3)
                    expect(avatarView.image?.size.width).toEventually(
                        beLessThanOrEqualTo(360), timeout: 3)
                    expect(avatarView.image?.size.height).toEventually(
                        beLessThanOrEqualTo(360), timeout: 3)
                }
            }
        }
    }
}
