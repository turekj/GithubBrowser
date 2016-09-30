@testable import GithubBrowser
import Nimble
import Quick
import RxBlocking
import RxSwift


class UserRepositoryViewControllerSpec: QuickSpec {
    
    override func spec() {
        describe("UserRepositoryViewController") {
            let searchBar = UISearchBar()
            let list = UITableView()
            let view = UserRepositoryView(searchBar: searchBar, list: list)
            let userRepositoryService = UserRepositorySearchServiceMock()
            
            let sut = UserRepositoryViewController(
                view: view, userRepositoryService: AnySearchService(userRepositoryService))
            sut.viewDidLoad()
            
            context("When search term has changed") {
                it("Should return empty results if term is shorter than two characters") {
                    let entries = [UserRepository(id: 4, title: "T", url: "I", type: .user)]
                    userRepositoryService.searchResult = Observable.just(entries)
                    
                    self.fireSearchBarTextChangeEvent(searchBar: view.searchBar, text: "A")
                    let result = try! sut.searchResults.toBlocking().first()

                    expect(result?.isEmpty).to(beTrue())
                }
                
                it("Should get results from service if term is at least two characters long") {
                    let entries = [UserRepository(id: 4, title: "T", url: "I", type: .user)]
                    userRepositoryService.searchResult = Observable.just(entries)
                    
                    self.fireSearchBarTextChangeEvent(searchBar: view.searchBar, text: "AB")
                    let result = try! sut.searchResults.toBlocking().first()
                    
                    expect(result?.count).to(equal(1))
                    expect(result?[0].id).to(equal(4))
                }
                
                it("Should return empty results if fetching data from service fails") {
                    userRepositoryService.searchResult = Observable.error(
                        DeserializationError.improperInputFormat)

                    self.fireSearchBarTextChangeEvent(searchBar: view.searchBar, text: "ABC")
                    let result = try! sut.searchResults.toBlocking().first()
                    
                    expect(result?.isEmpty).to(beTrue())
                }
                
                it("Should sort entries from service by id") {
                    let entries = [UserRepository(id: 4, title: "T", url: "I", type: .user),
                                   UserRepository(id: 2, title: "E", url: "L", type: .user)]
                    userRepositoryService.searchResult = Observable.just(entries)
                    
                    self.fireSearchBarTextChangeEvent(searchBar: view.searchBar, text: "ABCD")
                    let result = try! sut.searchResults.toBlocking().first()
                    
                    expect(result?.count).to(equal(2))
                    expect(result?[0].id).to(equal(2))
                    expect(result?[1].id).to(equal(4))
                }
            }
        }
    }
    
    func fireSearchBarTextChangeEvent(searchBar: UISearchBar, text: String) {
        searchBar.text = text
        searchBar.delegate?.searchBar?(searchBar, textDidChange: text)
    }
}
