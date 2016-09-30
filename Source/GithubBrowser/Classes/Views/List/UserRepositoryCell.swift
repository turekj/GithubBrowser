import Cartography
import UIKit


class UserRepositoryCell: UITableViewCell {
    
    let titleView = UILabel()
    let subtitleView = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupView()
    }
    
    private func setupView() {
        self.setupTitleView()
        self.setupSubtitleView()
    }
    
    private func setupTitleView() {
        self.titleView.font = UIFont.systemFont(ofSize: UIFont.labelFontSize)
        self.titleView.lineBreakMode = .byTruncatingTail
        self.titleView.textColor = UIColor.black
        self.contentView.addSubview(self.titleView)
        
        constrain(self.titleView) { v in
            v.top == v.superview!.top
            v.leading == v.superview!.leading + 10
            v.trailing == v.superview!.trailing - 10
            v.height == v.superview!.height * 0.6
        }
    }
    
    private func setupSubtitleView() {
        self.subtitleView.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        self.subtitleView.lineBreakMode = .byTruncatingTail
        self.subtitleView.textColor = UIColor.lightGray
        self.contentView.addSubview(self.subtitleView)
        
        constrain(self.subtitleView, self.titleView) { sv, tv in
            sv.top == tv.bottom
            sv.leading == tv.leading
            sv.trailing == tv.trailing
            sv.bottom == sv.superview!.bottom
        }
    }
    
    // MARK: - Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
