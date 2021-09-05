import UIKit
import NSObject_Rx

final class MainViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MainViewModel!
    
    private lazy var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:layout)
        return collectionView
    }()
    
    private lazy var searchButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Search"
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func bindViewModel() {
        viewModel.title
            .asDriver(onErrorJustReturn: "")
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.issuList
            .drive(listCollectionView.rx.items(cellIdentifier: IssueCell.identifier, cellType: IssueCell.self)) { row, issue, cell in
                cell.configrue(issue, row)
            }.disposed(by: rx.disposeBag)
    }
}

// MARK: Setup
private extension MainViewController {
    private func setup() {
        setupNavigationTitle()
        setupCollectionView()
    }
    
    private func setupNavigationTitle() {
        navigationController?.view.backgroundColor = .systemGray6
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = searchButton
    }
    
    private func setupCollectionView() {
        view.addSubview(listCollectionView)
        listCollectionView.translatesAutoresizingMaskIntoConstraints = false
        listCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        listCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        listCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        listCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        listCollectionView.backgroundColor = .white
        listCollectionView.register(IssueCell.self, forCellWithReuseIdentifier: IssueCell.identifier)
        setupCollectionViewDelegate()
    }
    
    private func setupCollectionViewDelegate() {
        listCollectionView.rx.setDelegate(self).disposed(by: rx.disposeBag)
        
        listCollectionView.rx.modelSelected(Issue.self)
            .subscribe(onNext: { [unowned self] issue in
                self.viewModel.moveToDetailVC(issue)
            }).disposed(by: rx.disposeBag)
    }
    
    private func setupSearchButton() {
        searchButton.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                self.viewModel.moveToSearchVC()
            }).disposed(by: rx.disposeBag)
    }
}

// MARK: CellSize
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = listCollectionView.frame.height * 0.1
        let width = listCollectionView.frame.width
        return CGSize(width: width, height: height)
    }
}
