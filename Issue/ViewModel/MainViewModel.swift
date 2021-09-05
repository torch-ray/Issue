import Foundation
import RxSwift
import RxCocoa

final class MainViewModel: CommonViewModel {
    
    let title = BehaviorRelay<String>(value: "apple/swift")
    
    lazy var issuList: Driver<[Issue]> = {
        return storage.list().asDriver(onErrorJustReturn: [])
    }()
    
    override init(storage: MemoryStorageType, sceneCoordinator: SceneCoordinatorType) {
        super.init(storage: storage, sceneCoordinator: sceneCoordinator)
        callDefaultAPI(from: UrlList.appleSwift(title.value))
    }
    
    func moveToDetailVC(_ issue: Issue) {
        storage.selected(issue)
        let viewModel = DetailViewModel(storage: storage, sceneCoordinator: sceneCoordinator)
        let scene = Scene.DetailVC(viewModel)
        sceneCoordinator.transition(to: scene, using: .push, animated: false)
    }
    
    func moveToSearchVC() {
        let viewModel = SearchViewModel(storage: storage, sceneCoordinator: sceneCoordinator)
        let scene = Scene.searchVC(viewModel)
        sceneCoordinator.transition(to: scene, using: .modal, animated: false)
    }
}

private extension MainViewModel {
    
    private func callDefaultAPI(from url: UrlList) {
        NetworkManager.getIssue(UrlList.generateURL(url)())
            .subscribe(onNext: { [unowned self] data in
                self.createIssue(list: data)
            }).disposed(by: rx.disposeBag)
    }
    
    private func createIssue(list: [Issue]) {
        list.forEach { storage.create($0) }
    }
}
