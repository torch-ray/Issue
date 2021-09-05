import UIKit

final class DetailViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: DetailViewModel!
    
    private lazy var userInfoView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var userProfile: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
    }
}

// MARK: Setup
private extension DetailViewController {
    private func setup() {
        view.backgroundColor = .white
        setupNavigationViewController()
        setupUserInfoView()
        setupProfileImageView()
    }
    
    private func setupNavigationViewController() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupUserInfoView() {
        view.addSubview(userInfoView)
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        userInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        userInfoView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        userInfoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    private func setupProfileImageView() {
        userInfoView.addSubview(userProfile)
        userProfile.translatesAutoresizingMaskIntoConstraints = false
        userProfile.centerYAnchor.constraint(equalTo: userInfoView.centerYAnchor).isActive = true
        userProfile.widthAnchor.constraint(equalTo: userInfoView.widthAnchor, multiplier: 0.1).isActive = true
        userProfile.heightAnchor.constraint(equalTo: userInfoView.widthAnchor, multiplier: 0.1).isActive = true
        userProfile.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 10).isActive = true
    }
}
