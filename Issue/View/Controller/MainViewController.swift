import UIKit
import NSObject_Rx

final class MainViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MainViewModel!
    
    private lazy var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        listCollectionView.register(IssueCell.self, forCellWithReuseIdentifier: IssueCell.identifier)
    }
    
    func bindViewModel() {
        viewModel.issuList
            .drive(listCollectionView.rx.items(cellIdentifier: IssueCell.identifier, cellType: IssueCell.self)) { _, issue, cell in
                cell.configrue(issue)
            }.disposed(by: rx.disposeBag)

    }
}

// MARK: Setup
private extension MainViewController {
    private func setup() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(listCollectionView)
        listCollectionView.translatesAutoresizingMaskIntoConstraints = false
        listCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        listCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        listCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        listCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        listCollectionView.backgroundColor = .white
    }
}
