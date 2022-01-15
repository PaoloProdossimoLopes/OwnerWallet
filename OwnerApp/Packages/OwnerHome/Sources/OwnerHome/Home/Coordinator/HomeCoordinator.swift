//
//  File.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 20/12/21.
//

import UIKit
import OwnerLIB

public class HomeCoordinator: Coordinator {

    public var currentController: UIViewController
    private var assets: [ListOfMainAssets] = []
    
    private let service: HomeAPI = .shared

    public override init(with navigation: UINavigationController) {
        
        let viewModel: HomeViewModel = .init()
        let vc = HomeController(viewModel: viewModel)
        let nav = UINavigationController(rootViewController: vc)
        currentController = nav
        
        super.init(with: navigation)

        service.fetchAssets { assets in
            assets.forEach { viewModel.assets.append($0) }
        }
        
        childCoordinators.append(self)
        configureTabBar()
    }
    
    private func configureTabBar() {
        let homeImage = UIImage(systemName: "house.fill")
        currentController.tabBarItem = UITabBarItem(
            title: nil, image: homeImage,tag: 1
        )
    }

    open override func start() {
        navigationController.pushViewController(currentController, animated: true)
    }

}
