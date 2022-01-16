//
//  AuthenticatorCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 16/01/22.
//

import OwnerLIB
import UIKit

protocol AuthenticatorCoordinatorNavigate: AnyObject {
    func navigateToHome()
}

final class AuthenticatorCoordinator: Coordinator {
    
    let signInCoordinator: SignInCoordinator
    var navigate: AuthenticatorCoordinatorNavigate?
    
    init(_ nav: UINavigationController) {
        signInCoordinator = .init(nav)
        super.init(with: nav)
    }
    
    override func start() {
        signInCoordinator.navigate = self
        signInCoordinator.start()
    }
    
}

extension AuthenticatorCoordinator: SignInCoordinatorNavigate {
    func navigateToHome() {
        navigate?.navigateToHome()
    }
}

