//
//  OwnerWallet.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 20/12/21.
//

import UIKit
import OwnerLIB

protocol OwnerWalletCoordinatorNavigate: AnyObject {
    func navigateToDetail(_ asset: AssetModel)
}

final class OwnerWalletCoordinator: Coordinator {
    
    public var currentController: UIViewController
    
    private var myWalletCoordinator: MyWalletCoordinator
    private var walletDetailCoordinator: WalletDetailCoordinator
    
    override init(with navigation: UINavigationController) {
        
        myWalletCoordinator = .init(navigation: navigation)
        myWalletCoordinator.start()
        
        let nav = myWalletCoordinator.currentViewController
        currentController = nav
        walletDetailCoordinator = .init(nav)
        
        super.init(with: nav)
        
        myWalletCoordinator.navigateDelegate = self
        childCoordinators.append(self)
        configureTabBar()
    }
    
    private func configureTabBar() {
        let homeImage = UIImage(systemName: "wallet.pass.fill")
        currentController.tabBarItem = UITabBarItem(
            title: nil, image: homeImage, tag: 1
        )
    }
    
    private func navigateToAssetDetail(_ asset: AssetModel) {
        walletDetailCoordinator = .init(navigationController, asset: asset)
        walletDetailCoordinator.start()
    }
    
}

extension OwnerWalletCoordinator: OwnerWalletCoordinatorNavigate {
    func navigateToDetail(_ asset: AssetModel) {
        navigateToAssetDetail(asset)
    }
    
    
}




