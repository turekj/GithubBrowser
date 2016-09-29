import Cartography
import UIKit


class UserRepositoryView: UIView {
    
    let searchField: UITextField
    let list: UITableView
    
    init(searchField: UITextField, list: UITableView) {
        self.searchField = searchField
        self.list = list
        
        super.init(frame: .zero)
        
        self.setupView()
    }
    
    private func setupView() {
        self.setupSearchField()
        self.setupList()
    }
    
    private func setupSearchField() {
        self.addSubview(self.searchField)
        
        constrain(self.searchField) { f in
            f.top == f.superview!.top
            f.leading == f.superview!.leading + 10
            f.trailing == f.superview!.trailing - 10
            f.height == 40
        }
    }
    
    private func setupList() {
        self.addSubview(self.list)
        
        constrain(self.list, self.searchField) { l, f in
            l.top == f.bottom
            l.leading == l.superview!.leading
            l.trailing == l.superview!.trailing
            l.bottom == l.superview!.bottom
        }
    }
    
    // MARK: - Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
