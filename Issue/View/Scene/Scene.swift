import UIKit

enum Scene {
    case mainVC(MainViewModel)
}

extension Scene {
    
    func instantiate() -> UIViewController {
        
        switch self {
        case .mainVC(let viewModel):
            let nav = UINavigationController()
            guard var listVC = nav.viewControllers.first as? MainViewController else {
                fatalError()
            }
            listVC.bind(viewModel: viewModel)
            return nav
        }
    }
}

