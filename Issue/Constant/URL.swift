import Foundation

enum UrlList {
    case appleSwift(String)
}

extension UrlList {
    func generateURL() -> URL {
        switch self {
        case .appleSwift(let repository):
            guard let url = URL(string: "https://api.github.com/repos/\(repository)/issues") else {
                return URL(string: "https://api.github.com/repos/apple/swift/issues")!
            }
            return url
        }
    }
}
