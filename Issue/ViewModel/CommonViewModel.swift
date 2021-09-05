import Foundation

class CommonViewModel {
    
    let storage: MemoryStorageType
    let sceneCoordinator: SceneCoordinatorType
    
    init(storage: MemoryStorageType, sceneCoordinator: SceneCoordinatorType) {
        self.storage = storage
        self.sceneCoordinator = sceneCoordinator
    }
}
