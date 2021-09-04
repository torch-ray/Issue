import UIKit

enum Scene {
    case mainVC
}

extension Scene {
    
    func instantiate() -> UIViewController {
        
        switch self {
        case .mainVC(let viewModel):
            let nav = UINavigationController()
            guard var listVC = nav.viewControllers.first as? AlbumListViewController else {
                fatalError()
            }
            listVC.bind(viewModel: viewModel)
            return nav
        }
    }
}

