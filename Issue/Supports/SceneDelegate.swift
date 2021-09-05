import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        setupMainScene()
    }
    
    func setupMainScene() {
        let storage = MemoryStrorage()
        let sceneCoordinator = SceneCoordinator(window: window!)
        let viewModel = MainViewModel(storage: storage, sceneCoordinator: sceneCoordinator)
        let mainScene = Scene.mainVC(viewModel)
        sceneCoordinator.transition(to: mainScene, using: .root, animated: false)
    }
}

