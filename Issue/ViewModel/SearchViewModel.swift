import Foundation

final class SearchViewModel: CommonViewModel {
    
    func searchRepository(_ repo: String) {
        let url = UrlList.repository(repo).generateURL()
        NetworkManager.getIssue(url)
            .subscribe(onNext: { newData in
                self.storage.removeAll()
                self.createIssue(list: newData)
            }).disposed(by: rx.disposeBag)
    }
    
    func makeCloseAction() {
        sceneCoordinator.close(animated: false)
    }
}

private extension SearchViewModel {
    private func createIssue(list: [Issue]) {
        list.forEach { storage.create($0) }
    }
}
