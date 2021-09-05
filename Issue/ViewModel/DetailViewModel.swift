import Foundation
import RxSwift
import RxCocoa

final class DetailViewModel: CommonViewModel {
    
    lazy var title: Driver<String> = {
        return Observable.just(String(storage.currentInfo().number)).asDriver(onErrorJustReturn: "")
    }()
    
    lazy var currentIssue: Driver<Issue> = {
        return Observable.just(storage.currentInfo()).asDriver(onErrorJustReturn: Issue.empty())
    }()
}
