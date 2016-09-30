import Foundation


struct Repository {
    let id: Int
    let name: String
    let url: String
    
    init(id: Int, name: String, url: String) {
        self.id = id
        self.name = name
        self.url = url
    }
}
