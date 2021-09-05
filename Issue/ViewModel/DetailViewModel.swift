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
    
    lazy var userID: Driver<String> = {
        return Observable.just(storage.currentInfo().user.login).asDriver(onErrorJustReturn: "")
    }()
    
    lazy var userImage: UIImage = {
        let url = URL(string: storage.currentInfo().user.avatarURL)!
        return DataFormatter.stringToImage(url)
    }()
    
    lazy var contentBody: Driver<String> = {
        return Observable.just(storage.currentInfo().body ?? "내용 없음").asDriver(onErrorJustReturn: "")
    }()
}
