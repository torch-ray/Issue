import Foundation
import RxCocoa

final class MainViewModel: CommonViewModel {
    
    lazy var issuList: Driver<[Issue]> = {
        return storage.list().asDriver(onErrorJustReturn: [])
    }()
}
