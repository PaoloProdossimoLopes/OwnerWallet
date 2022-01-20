//
//  AproachCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 12/01/22.
//

import OwnerLIB
import UIKit

final class AproachCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewModel: AproachViewModel = .init()
        let controller = AproachViewController(viewModel: viewModel)
        controller.navigate = self
        router.present(controller, animated: true)
    }
    
}

extension AproachCoordinator: AproachViewControllerNavigate {
    func aprachButtonWasTapped() {
        if let modalRouter = router as? ModalRouter {
            modalRouter.pop(animated: true)
        }
    }
    
    func closeButtonWasTapped() {
        if let modalRouter = router as? ModalRouter {
            modalRouter.pop(animated: true)
        }
    }
    
}
