import Foundation

final class MemoryStrorage: MemoryStorageType {
    
    @discardableResult
    func create(_ issue: Issue) -> Observable<Issue> {
    }
    
    @discardableResult
    func list() -> Observable<[Issue]> {
    }
}
