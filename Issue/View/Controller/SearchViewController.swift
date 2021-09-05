import UIKit

final class SearchViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: SearchViewModel!
    
    private lazy var mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func bindViewModel() {
    }
}

private extension SearchViewController {
    
    private func setup() {
        view.isOpaque = true
        setupMainView()
    }
    
    private func setupMainView() {
        view.addSubview(mainView)
        mainView.backgroundColor = .white
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
