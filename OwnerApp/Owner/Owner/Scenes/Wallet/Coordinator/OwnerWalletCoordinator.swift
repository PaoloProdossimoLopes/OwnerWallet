//
//  OwnerWallet.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 20/12/21.
//

import UIKit
import OwnerLIB

final class OwnerWalletCoordinator: Coordinator {
    
    var router: Router
    var children: [Coordinator] = []
    
    var myWalletCoordinator: MyWalletCoordinator {
        return MyWalletCoordinator(router: router)
    }
    
    let dispachGroup: DispatchGroup = .init()
    private let service: MyWalletAPI = .shared
    private var assets: [AssetModel] = []
    
    init(router: Router) {
        self.router = router
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        myWalletCoordinator.present(animated: animated, onDismissed: onDismissed)
    }
    
}
