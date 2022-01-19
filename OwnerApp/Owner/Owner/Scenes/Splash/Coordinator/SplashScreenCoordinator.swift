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
    
}

extension SplashScreenCoordinator: SplashScreenViewControllerNavigate {
    func advanceScreen(_ viewController: SplashScreenViewController) {
        
        let modalRouter = ModalRouter(
            .fullScreen, parentViewController: viewController, showCancelButton: false
        )
        
        if logginIsSucceded {
            let coord = HomeCoordinator(router: modalRouter)
            coord.present(animated: true, onDismissed: nil)
            return
        } else {
            let coord = AuthenticatorCoordinator(router: modalRouter)
            coord.present(animated: true, onDismissed: nil)
            return
        }
    }
}
