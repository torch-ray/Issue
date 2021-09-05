import Foundation
import RxCocoa

final class DetailViewModel: CommonViewModel {
    
    lazy var currentIssue: Driver<Issue> = {
        return storage.currentInfo().asDriver(onErrorJustReturn: Issue.empty())
    }()
}
