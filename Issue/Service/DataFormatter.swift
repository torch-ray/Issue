import UIKit

final class DataFormatter {
    
    static func stringToImage(_ url: URL) -> UIImage {
        do {
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)
            return image!
        } catch {
            return UIImage(systemName: "pencil")!
        }
    }
}
