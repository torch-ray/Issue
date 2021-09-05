import Foundation
import RxSwift
import RxCocoa

final class MemoryStrorage: MemoryStorageType {
    
    private var issueStorage: [Issue] = []
    private lazy var store = BehaviorSubject<[Issue]>(value: issueStorage)
    
    private var currentIssue = Issue.empty()
    private lazy var currentStore = BehaviorSubject<Issue>(value: currentIssue)
    
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
    
    @discardableResult
    func selected(_ issue: Issue) -> Observable<Issue> {
        currentIssue = issue
        currentStore.onNext(currentIssue)
        return Observable.just(issue)
    }
    
    @discardableResult
    func currentInfo() -> Observable<Issue> {
        return currentStore
    }
}
