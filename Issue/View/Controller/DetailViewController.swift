import UIKit

final class DetailViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: DetailViewModel!
    
    private lazy var userInfoView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var userProfile: UIImageView = {
        let imageView = UIImageView(image: viewModel.userImage)
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var contentBody: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.userID
            .drive(nameLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
        viewModel.contentBody
            .drive(contentBody.rx.text)
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
        setupUserNameLabel()
        setupBodyTextView()
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
    
    private func setupUserNameLabel() {
        userInfoView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: userInfoView.heightAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: userProfile.trailingAnchor, constant: 10).isActive = true
    }
    
    private func setupBodyTextView() {
        view.addSubview(contentBody)
        contentBody.translatesAutoresizingMaskIntoConstraints = false
        contentBody.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        contentBody.topAnchor.constraint(equalTo: userProfile.bottomAnchor).isActive = true
        contentBody.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}
