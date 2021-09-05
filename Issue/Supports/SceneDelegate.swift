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
        let viewModel = MainViewModel()
        let mainScene = Scene.mainVC(viewModel)
        let sceneCoordinator = SceneCoordinator(window: window!)
        sceneCoordinator.transition(to: mainScene, using: .root, animated: false)
    }
}

