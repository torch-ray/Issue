import Foundation

final class SearchViewModel: CommonViewModel {
    
    
    func searchRepository(_ repo: String) {
        let url = UrlList.repository(repo).generateURL()
        NetworkManager.getIssue(url)
            .subscribe(onNext: { newData in
                
            }).disposed(by: rx.disposeBag)
    }
    
    func makeCloseAction() {
        sceneCoordinator.close(animated: false)
    }
}
