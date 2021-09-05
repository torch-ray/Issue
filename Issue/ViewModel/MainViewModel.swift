import Foundation
import RxSwift
import RxCocoa

final class MainViewModel: CommonViewModel {
    
    lazy var issuList: Driver<[Issue]> = {
        return storage.list().asDriver(onErrorJustReturn: [])
    }()
    
    override init(storage: MemoryStorageType, sceneCoordinator: SceneCoordinatorType) {
        super.init(storage: storage, sceneCoordinator: sceneCoordinator)
        callDefaultAPI()
    }
}

private extension MainViewModel {
    
    private func callDefaultAPI() {
        let url = URL(string: "https://api.github.com/repos/apple/swift/issues")
        NetworkManager.getIssue(url!)
            .subscribe(onNext: { [unowned self] data in
                self.createIssue(list: data)
            }).disposed(by: rx.disposeBag)
    }
    
    private func createIssue(list: [Issue]) {
        list.forEach { storage.create($0) }
    }
}
