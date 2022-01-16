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
    
    var userIsLogged: Bool = false
    
    init(with navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        self.navigationController.navigationBar.isHidden = true
        if userIsLogged { configureHomeTab() }
        else { goToAuthentication() }
    }
    
    func configureHomeTab() {
        let ownerTabViewController = OwnerTabViewController(tabs: configureListViewControllers())
        ownerTabViewController.modalPresentationStyle = .fullScreen
        navigationController.show(ownerTabViewController, navigate: .present)
    }
    
    private func configureListViewControllers() -> [UIViewController] {
        let homeCoordinator = HomeCoordinator(with: navigationController)
        let walletCoordinator = OwnerWalletCoordinator(with: navigationController)
        
        var list = [UIViewController]()
        list.append(homeCoordinator.currentController)
        list.append(walletCoordinator.currentController)
        
        return list
    }
    
    private func goToAuthentication() {
        let authCoordinator = AuthenticatorCoordinator(navigationController)
        authCoordinator.navigate = self
        authCoordinator.start()
    }
    
}

extension OwnerCoordinator: AuthenticatorCoordinatorNavigate {
    func navigateToHome() {
        configureHomeTab()
    }
}
