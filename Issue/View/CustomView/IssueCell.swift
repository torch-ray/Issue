import UIKit
import RxGesture

final class IssueCell: UICollectionViewCell {
    
    private lazy var issueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var underLine: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var bannerImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bannerImage.isHidden = true
    }
    
    func configrue(_ issue: Issue, _ row: Int) {
        if row == 4 {
            bannerImage.isHidden = false
            return
        }
        issueLabel.text = "\(issue.number) - \(issue.title)"
    }
}

// MARK: Setup
private extension IssueCell {
    private func setup() {
        setupLabel()
        setupUnderLineView()
        setupBannerImage()
        setupOpenURL()
    }
    
    private func setupLabel() {
        addSubview(issueLabel)
        issueLabel.translatesAutoresizingMaskIntoConstraints = false
        issueLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        issueLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        issueLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func setupUnderLineView() {
        addSubview(underLine)
        underLine.backgroundColor = .lightGray
        underLine.translatesAutoresizingMaskIntoConstraints = false
        underLine.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        underLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        underLine.bottomAnchor.constraint(equalTo: issueLabel.bottomAnchor).isActive = true
    }
    
    private func setupBannerImage() {
        addSubview(bannerImage)
        bannerImage.isUserInteractionEnabled = true
        bannerImage.translatesAutoresizingMaskIntoConstraints = false
        bannerImage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bannerImage.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        bannerImage.image = DataFormatter.stringToImage(UrlList.banner.generateURL())
        bannerImage.isHidden = true
    }
    
    private func setupOpenURL() {
        bannerImage.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                guard let url = URL(string: "http://thingsflow.com/ko/home/"), UIApplication.shared.canOpenURL(url) else {
                    return
                }
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }).disposed(by: rx.disposeBag)
    }
}

// MARK: Identifier
extension UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
}
