//
//  AuthenticatorCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 16/01/22.
//

import OwnerLIB
import UIKit

final class AuthenticatorCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let coord = SignInCoordinator(router: router)
        coord.present(animated: true, onDismissed: nil)
    }
    
}
