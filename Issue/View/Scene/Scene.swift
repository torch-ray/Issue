import UIKit

enum Scene {
    case mainVC(MainViewModel)
}

extension Scene {
    
    func instantiate() -> UIViewController {
        
        switch self {
        case .mainVC(let viewModel):
            var listVC = MainViewController()
            let nav = UINavigationController(rootViewController: listVC)
            listVC.bind(viewModel: viewModel)
            return nav
        }
    }
}

