import UIKit

final class IssueCell: UICollectionViewCell {
    
    private lazy var issueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var underLine: UIView = {
        let view = UIView()
        return view
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
}

// MARK: Setup
private extension IssueCell {
    private func setup() {
        setupLabel()
        setupUnderLineView()
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
}

// MARK: Identifier
extension UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
}
