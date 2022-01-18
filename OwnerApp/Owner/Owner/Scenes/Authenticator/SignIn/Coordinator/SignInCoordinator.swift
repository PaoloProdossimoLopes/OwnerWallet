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
    func goToRegister() 
}

final class SignInCoordinator: Coordinator {
    
    var navigate: SignInCoordinatorNavigate?
    
    var currentViewController: UIViewController?
    
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
        
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        
        currentViewController = nav
        navigationController.show(nav, navigate: .present)
    }
    
}

extension SignInCoordinator: SignInViewControllerNavigate {
    func navigateToRegister() {
        let view = UIViewController()
        view.view.backgroundColor = .red
        navigationController.present(view, animated: true, completion: nil)
    }
    
    func navigateToHome() {
        navigationController.close(.dissmis) { [weak self] in
            self?.navigate?.navigateToHome()
        }
    }
}
