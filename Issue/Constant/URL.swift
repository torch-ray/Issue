import Foundation

enum UrlList {
    case appleSwift(String)
    case banner
}

extension UrlList {
    func generateURL() -> URL {
        switch self {
        case .appleSwift(let repository):
            guard let url = URL(string: "https://api.github.com/repos/\(repository)/issues") else {
                return URL(string: "https://api.github.com/repos/apple/swift/issues")!
            }
            return url
        
        case .banner:
            guard let url = URL(string: "https://s3.ap-northeast-2.amazonaws.com/hellobot-kr-test/image/main_logo.png") else {
                fatalError("배너 이미지를 가져올 수 없음")
            }
            return url
        }
    }
}
