//
//  OwnerCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 19/12/21.
//

import UIKit

import OwnerLIB
import OwnerHome

final class OwnerCoordinator: Coordinator {
    
    private(set) var router: Router
    var children: [Coordinator] = []
    
    init(router: Router) {
        self.router = router
        present(animated: true, onDismissed: nil)
    }

    func present(animated: Bool, onDismissed: (() -> Void)?) {
        
        let coord = SplashScreenCoordinator(router: router)
        coord.present(animated: true, onDismissed: nil)
        
    }
 
    
}
