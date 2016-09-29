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
    }
    
    private func setupList() {
        self.addSubview(self.list)
    }
    
    // MARK: - Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
