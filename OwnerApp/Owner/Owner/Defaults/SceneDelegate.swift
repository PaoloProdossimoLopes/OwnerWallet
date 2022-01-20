//
//  SceneDelegate.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 19/12/21.
//

import UIKit
import OwnerLIB
import OwnerHome

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        guard let window = window else { return }
        
        let router: ModuleRouter = .init(window: window)
        let coordinator: OwnerCoordinator = .init(router: router)
        coordinator.present(animated: true, onDismissed: nil)
    }

    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }

}

