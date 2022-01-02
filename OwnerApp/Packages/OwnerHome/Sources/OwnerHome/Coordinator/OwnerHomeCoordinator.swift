//
//  OwnerHomeCoordinator.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 19/12/21.
//

import UIKit
import OwnerLIB

//public protocol OwnerHomeCoordinatorNavigateDelegate: AnyObject {
//    func addNewButtonNavigate()
//}
//
//public class OwnerHomeCoordinator: Coordinator {
//
//
//    public weak var navigateDelegte: OwnerHomeCoordinatorNavigateDelegate?
//
//    public required init(nav: UINavigationController) {
//        self.navigationController = nav
//    }
//
//    public override func start() {
//
//        showHome()
//    }
//
//    private func showHome() {
//        let viewModel = OwnerHomeViewModel()
//        let viewController = OwnerHomeViewController(self, viewModel: viewModel)
//        let navigation = UINavigationController(rootViewController: viewController)
//        navigation.modalPresentationStyle = .fullScreen
//        navigationController.show(navigation, navigate: .present)
//    }
//
//}
//
//MARK: - OwnerHomeViewControllerNavigationDelegate
//extension OwnerHomeCoordinator: OwnerHomeViewControllerNavigationDelegate {
//
//    func addNewButtonNavigate() {
//        navigateDelegte?.addNewButtonNavigate()
//    }
//
//}
