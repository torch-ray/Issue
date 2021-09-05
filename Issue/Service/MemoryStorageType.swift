import Foundation
import RxSwift

protocol MemoryStorageType {
    
    @discardableResult
    func create(_ issue: Issue) -> Observable<Issue>
    
    @discardableResult
    func list() -> Observable<[Issue]>
}
