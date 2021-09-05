import Foundation
import Alamofire
import RxSwift

final class NetworkManager: NetworkManagerType {
    
    static func getIssue(_ url: URL) -> Observable<[Issue]> {
        return Observable.create { observer in
            AF.request(url, method: .get)
                .responseDecodable(of: [Issue].self) { response in
                    switch response.result {
                    case .failure(let error):
                        observer.onError(error)
                    case .success(let data):
                        observer.onNext(data)
                        observer.onCompleted()
                    }
                }
            return Disposables.create()
        }
        
    }
}
