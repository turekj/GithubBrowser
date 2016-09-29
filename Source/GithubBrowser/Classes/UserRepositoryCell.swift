import Cartography
import UIKit


class UserRepositoryCell: UITableViewCell {
    
    let titleView = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupView()
    }
    
    private func setupView() {
        self.setupTitleView()
    }
    
    private func setupTitleView() {
        self.contentView.addSubview(self.titleView)
        
        constrain(self.titleView) { v in
            v.edges == v.superview!.edges
        }
    }
    
    // MARK: - Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
