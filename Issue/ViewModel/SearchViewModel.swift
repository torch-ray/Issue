import Foundation

final class SearchViewModel: CommonViewModel {
    
    func makeCloseAction() {
        sceneCoordinator.close(animated: false)
    }
}
