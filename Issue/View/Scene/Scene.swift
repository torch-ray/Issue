import UIKit

enum Scene {
    case mainVC(MainViewModel)
    case DetailVC(DetailViewModel)
    case searchVC(SearchViewModel)
}

extension Scene {
    
    func instantiate() -> UIViewController {
        
        switch self {
        case .mainVC(let viewModel):
            var listVC = MainViewController()
            let nav = UINavigationController(rootViewController: listVC)
            listVC.bind(viewModel: viewModel)
            return nav
            
        case .DetailVC(let viewModel):
            var detailVC = DetailViewController()
            detailVC.bind(viewModel: viewModel)
            return detailVC
            
        case .searchVC(let viewModel):
            var searVC = SearchViewController()
            searVC.bind(viewModel: viewModel)
            return searVC
        }
    }
}

