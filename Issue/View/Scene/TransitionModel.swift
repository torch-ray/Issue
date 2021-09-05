import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case unknown
    case cannotFindNavigationController
    case cannotPopViewController
}
