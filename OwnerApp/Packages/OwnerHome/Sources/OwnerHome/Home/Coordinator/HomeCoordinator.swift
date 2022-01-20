//
//  File.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 20/12/21.
//

import UIKit
import OwnerLIB

public class HomeCoordinator: Coordinator {
    
    public var currentController: UIViewController?
    public var children: [Coordinator] = []
    public var router: Router
    private var controller: HomeViewController?
    
    public init(router: Router) {
        self.router = router
        configurate()
    }
    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        if let vc = currentController {
            router.present(vc, animated: true)
        }
    }
    
    private func configurate() {
        self.currentController = setupController()
        self.controller?.tabBarItem = setupTabBarIcon()
    }
    
    private func setupTabBarIcon() -> UITabBarItem {
        let homeImage = UIImage(systemName: "house.fill")
        return UITabBarItem(title: nil, image: homeImage,tag: 1)
    }
    
    private func setupController() -> UINavigationController {
        let viewModel = HomeViewModel()
        self.controller = HomeViewController(viewModel: viewModel)
        if let UController = controller {
            return UINavigationController(rootViewController: UController)
        }
        return UINavigationController()
    }

}
