//
//  SplashScreenCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 19/01/22.
//

import OwnerLIB
import OwnerHome
import UIKit

final class SplashScreenCoordinator: Coordinator {
    
    private var logginIsSucceded: Bool = true
    var children: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }

    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let controller = SplashScreenViewController()
        controller.navigate = self
        router.present(controller, animated: true)
    }
    
    private func routeTo(_ viewController: SplashScreenViewController) {
        let modalRouter = ModalRouter(
            .fullScreen, parentViewController: viewController,
            navigationBarIsHidden: true, showCancelButton: false
        )
        
        if logginIsSucceded {
            routeToInitialPageLogged(router: modalRouter)
            return
        } else {
            routeToAuthentication(router: modalRouter)
            return
        }
    }
    
    func routeToInitialPageLogged(router atRouter: Router) {
        let ownerTabViewController = OwnerTabViewController(tabs: configureListViewControllers())
        atRouter.present(ownerTabViewController, animated: true)
    }
    
    private func configureListViewControllers() -> [UIViewController] {
        let homeCoordinator = HomeCoordinator(router: router)
        let walletCoordinator = OwnerWalletCoordinator(router: router)
        
        var list = [UIViewController]()
        list.append(homeCoordinator.currentController ?? UIViewController())
        list.append(walletCoordinator.myWalletCoordinator.currentController ?? UIViewController())
        
        return list
    }
    
    private func routeToAuthentication(router atRouter: Router) {
        let coord = AuthenticatorCoordinator(router: atRouter)
        coord.present(animated: true, onDismissed: nil)
    }
    
}

//MARK: - SplashScreenViewControllerNavigate
extension SplashScreenCoordinator: SplashScreenViewControllerNavigate {
    func advanceScreen(_ viewController: SplashScreenViewController) {
        routeTo(viewController)
    }
}
