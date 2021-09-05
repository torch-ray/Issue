import Foundation
import RxSwift

protocol NetworkManagerType {
    
    static func getIssue(_ url: URL) -> Observable<[Issue]>
}
