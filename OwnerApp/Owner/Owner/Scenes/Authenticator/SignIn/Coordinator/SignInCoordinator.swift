//
//  SignInCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 16/01/22.
//

import OwnerLIB
import UIKit

final class SignInCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewModel = SignInViewModel()
        let controller = SignInViewController(viewModel: viewModel)
        router.present(controller, animated: true)
    }

}
