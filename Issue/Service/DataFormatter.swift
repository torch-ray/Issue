import UIKit

final class DataFormatter {
    
    static func stringToImage(_ url: String) -> UIImage {
        guard let url = URL(string: url) else {
            return UIImage(systemName: "pencil")!
        }
        do {
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)
            return image!
        } catch {
            return UIImage(systemName: "pencil")!
        }
    }
}
