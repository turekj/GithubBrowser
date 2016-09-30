import Swinject
import UIKit


class DetailAssembly: AssemblyType {
    
    func assemble(container: Container) {
        container.register(UserDetailViewController.self) { r in
            let view = r.resolve(UserDetailView.self)!
            let userDetailsService = r.resolve(UserDetailsService.self)!
            
            return UserDetailViewController(view: view, detailsService: userDetailsService)
        }
        
        container.register(ControllerConfigurator.self, name: "detail") { _ in
            return UserDetailControllerConfigurator()
        }
        
        container.register(UserDetailView.self) { _ in
            let avatarView = UIImageView()
            let usernameLabel = UILabel()
            usernameLabel.text = "Username"
            usernameLabel.lineBreakMode = .byTruncatingTail
            let starCountLabel = UILabel()
            starCountLabel.text = "Star count"
            starCountLabel.lineBreakMode = .byTruncatingTail
            let followersLabel = UILabel()
            followersLabel.text = "Followers count"
            followersLabel.lineBreakMode = .byTruncatingTail
            
            return UserDetailView(avatarView: avatarView, usernameLabel: usernameLabel,
                                  starCountLabel: starCountLabel, followersLabel: followersLabel)
        }
    }
}
