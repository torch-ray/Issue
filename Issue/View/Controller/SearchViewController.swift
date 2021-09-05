import UIKit

final class SearchViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: SearchViewModel!
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var repositorySearchTextField: UITextField = {
        let searchTextField = UITextField()
        return searchTextField
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
        setupLabel()
        setupTextField()
    }
    
    private func setupMainView() {
        view.addSubview(mainView)
        mainView.backgroundColor = .white
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupLabel() {
        mainView.addSubview(titleLabel)
        titleLabel.text = "OrgName/RepoName"
        titleLabel.backgroundColor = .systemBlue
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
    }
    
    private func setupTextField() {
        mainView.addSubview(repositorySearchTextField)
        repositorySearchTextField.borderStyle = .line
        repositorySearchTextField.placeholder = "검색어를 입력하세요."
        repositorySearchTextField.translatesAutoresizingMaskIntoConstraints = false
        repositorySearchTextField.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.8).isActive = true
        repositorySearchTextField.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.2).isActive = true
        repositorySearchTextField.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        repositorySearchTextField.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        repositorySearchTextField.rx.controlEvent(.editingDidEndOnExit)
            .subscribe(onNext: { [unowned self] _ in
                self.viewModel.makeCloseAction()
                self.viewModel.searchRepository(repositorySearchTextField.text ?? "")
            }).disposed(by: rx.disposeBag)
    }
}
