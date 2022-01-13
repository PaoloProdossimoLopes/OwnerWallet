//
//  AproachCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 12/01/22.
//

import OwnerLIB
import UIKit

final class AproachCoordinator: Coordinator {
    
    init(_ nav: UINavigationController) {
        super.init(with: nav)
    }
    
    override func start() {
        goToAproachView()
    }
    
    private func goToAproachView() {
        let controller = AproachViewController()
        navigationController.show(controller, navigate: .present)
    }
    
}
