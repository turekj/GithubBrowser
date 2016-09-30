import Foundation


struct Repository: Equatable {
    let id: Int
    let name: String
    let url: String
    
    init(id: Int, name: String, url: String) {
        self.id = id
        self.name = name
        self.url = url
    }
}


func ==(lhs: Repository, rhs: Repository) -> Bool {
    return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.url == rhs.url
}
