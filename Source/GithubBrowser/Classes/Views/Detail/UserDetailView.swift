import Cartography
import UIKit


class UserDetailView: UIView {
    
    let avatarView: UIImageView
    let usernameLabel: UILabel
    let starCountLabel: UILabel
    let followersLabel: UILabel
    
    init(avatarView: UIImageView, usernameLabel: UILabel,
         starCountLabel: UILabel, followersLabel: UILabel) {
        self.avatarView = avatarView
        self.usernameLabel = usernameLabel
        self.starCountLabel = starCountLabel
        self.followersLabel = followersLabel
        
        super.init(frame: .zero)
        
        self.setupView()
    }
    
    private func setupView() {
        self.setupAvatarView()
        self.setupUsernameLabel()
        self.setupStarCountLabel()
        self.setupFollowersLabel()
        self.distributeSubviews()
    }
    
    private func setupAvatarView() {
        self.addSubview(self.avatarView)
        
        constrain(self.avatarView) { v in
            v.top == v.superview!.top + 10
            v.leading == v.superview!.leading + 10
            v.width == 60
            v.height == 60
        }
    }
    
    private func setupUsernameLabel() {
        self.addSubview(self.usernameLabel)
        
        constrain(self.usernameLabel) { l in
            l.width == l.superview!.width - 20
            l.height == 40
        }
    }
    
    private func setupStarCountLabel() {
        self.addSubview(self.starCountLabel)
        
        constrain(self.starCountLabel, self.usernameLabel) { scl, ul in
            scl.width == ul.width
            scl.height == ul.height
        }
    }
    
    private func setupFollowersLabel() {
        self.addSubview(self.followersLabel)
        
        constrain(self.followersLabel, self.starCountLabel) { fl, scl in
            fl.width == scl.width
            fl.height == scl.height
        }
    }
    
    private func distributeSubviews() {
        constrain(self.avatarView, self.usernameLabel,
                  self.starCountLabel, self.followersLabel) { av, ul, scl, fl in
            distribute(by: 10, vertically: av, ul, scl, fl)
            align(leading: av, ul, scl, fl)
        }
    }
    
    // MARK: - Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
