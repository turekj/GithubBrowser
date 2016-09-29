import Cartography
import UIKit


class UserRepositoryView: UIView {
    
    let searchBar: UISearchBar
    let list: UITableView
    
    init(searchBar: UISearchBar, list: UITableView) {
        self.searchBar = searchBar
        self.list = list
        
        super.init(frame: .zero)
        
        self.setupView()
    }
    
    private func setupView() {
        self.setupSearchBar()
        self.setupList()
    }
    
    private func setupSearchBar() {
        self.addSubview(self.searchBar)
        
        constrain(self.searchBar) { f in
            f.top == f.superview!.top
            f.leading == f.superview!.leading
            f.trailing == f.superview!.trailing
            f.height == 44
        }
    }
    
    private func setupList() {
        self.addSubview(self.list)
        
        constrain(self.list, self.searchBar) { l, f in
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