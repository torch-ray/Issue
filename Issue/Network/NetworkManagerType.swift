import Foundation
import RxSwift

protocol NetworkManagerType {
    
    func getIssue(_ url: URL) -> Observable<Issue>
}
