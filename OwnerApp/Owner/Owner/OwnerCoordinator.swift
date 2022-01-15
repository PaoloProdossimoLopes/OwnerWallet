//
//  OwnerCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 19/12/21.
//

import UIKit

import OwnerLIB
import OwnerHome

final class OwnerCoordinator: NSObject {
    
    var navigationController: UINavigationController
    
    init(with navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        self.navigationController.navigationBar.isHidden = true
        let ownerTabViewController = OwnerTabViewController(tabs: configureListViewControllers())
        navigationController.pushViewController(ownerTabViewController, animated: true)
    }
    
    private func configureListViewControllers() -> [UIViewController] {
        
        let homeCoordinator = HomeCoordinator(with: navigationController),
            walletCoordinator = OwnerWalletCoordinator(with: navigationController)
        
        var list = [UIViewController]()
        list.append(homeCoordinator.currentController)
        list.append(walletCoordinator.currentController)
        
        return list
        
    }
    
    
}
