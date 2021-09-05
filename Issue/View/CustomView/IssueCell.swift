import UIKit

final class IssueCell: UICollectionViewCell {
    
    private lazy var issueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func configrue(_ issue: Issue) {
        issueLabel.text = "\(issue.number) - \(issue.title)"
    }
    
    func setup() {
        addSubview(issueLabel)
        issueLabel.translatesAutoresizingMaskIntoConstraints = false
        issueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        issueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        issueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        issueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
}
