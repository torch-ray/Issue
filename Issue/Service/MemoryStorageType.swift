import Foundation
import RxSwift

protocol MemoryStorageType {
    
    @discardableResult
    func create(_ issue: Issue) -> Observable<Issue>
    
    @discardableResult
    func list() -> Observable<[Issue]>
    
    @discardableResult
    func selected(_ issue: Issue) -> Observable<Issue>
    
    @discardableResult
    func currentInfo() -> Observable<Issue>
}
