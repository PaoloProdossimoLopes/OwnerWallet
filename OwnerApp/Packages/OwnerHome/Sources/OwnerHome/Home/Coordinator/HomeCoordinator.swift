//
//  File.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 20/12/21.
//

import UIKit
import OwnerLIB

public class HomeCoordinator: Coordinator {
    
    public var children: [Coordinator] = []
    public var router: Router
    
    public init(router: Router) {
        self.router = router
    }
    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewModel = HomeViewModel()
        let controller = HomeViewController(viewModel: viewModel)
        router.present(controller, animated: true)
    }

}
