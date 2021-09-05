import UIKit

final class IssueCell: UICollectionViewCell {
    
    private lazy var issuLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    func configrue(_ issue: Issue) {
        issuLabel.text = "\(issue.number) - \(issue.title)"
    }
}
