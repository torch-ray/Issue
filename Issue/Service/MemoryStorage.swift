import Foundation
import RxSwift

final class MemoryStrorage: MemoryStorageType {
    
    private var issueStorage: [Issue] = [
        Issue(number: 4399, title: "asdf", user: User(login: "", avatarURL: ""), body: "")
    ]
    private lazy var store = BehaviorSubject<[Issue]>(value: issueStorage)
    
    @discardableResult
    func create(_ issue: Issue) -> Observable<Issue> {
        issueStorage.append(issue)
        store.onNext(issueStorage)
        return Observable.just(issue)
    }
    
    @discardableResult
    func list() -> Observable<[Issue]> {
        return store
    }
}
