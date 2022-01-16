//
//  SignInCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 16/01/22.
//

import OwnerLIB
import UIKit

protocol SignInCoordinatorNavigate: AnyObject {
    func navigateToHome()
}

final class SignInCoordinator: Coordinator {
    
    var navigate: SignInCoordinatorNavigate?
    
    init(_ navigation: UINavigationController) {
        super.init(with: navigation)
    }
    
    override func start() {
        goToSignViewController()
    }
    
    func goToSignViewController() {
        let viewModel = SignInViewModel()
        let controller = SignInViewController(viewModel: viewModel)
        controller.navigate = self
        controller.modalPresentationStyle = .fullScreen
        navigationController.show(controller, navigate: .present)
    }
    
}

extension SignInCoordinator: SignInViewControllerNavigate {
    func navigateToHome() {
        navigationController.close(.dissmis) { [weak self] in
            self?.navigate?.navigateToHome()
        }
    }
}
