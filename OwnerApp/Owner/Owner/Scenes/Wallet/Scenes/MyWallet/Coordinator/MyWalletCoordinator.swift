//
//  MyWalletCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import OwnerLIB
import UIKit

protocol MyWalletCoordinatorNavigate: AnyObject {
    func navigateToAssetDetail(_ asset: AssetModel)
}

final class MyWalletCoordinator: Coordinator {
    
    public var currentController: UINavigationController?
    public var children: [Coordinator] = []
    public var router: Router
    private var controller: MyWalletViewController?
    
    let dispachGroup: DispatchGroup = .init()
    private let service: MyWalletAPI = .shared
    private var assets: [AssetModel] = []
    
    init(router: Router) {
        self.router = router
        callAPI()
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        callAPI()

        dispachGroup.notify(queue: .main) {
            self.routeTo(animated, onDismissed: onDismissed)
        }
    }
    
    private func callAPI() {
        service.fetchListOfAssets { [weak self] reponseList in
            reponseList.forEach {
                let model = AssetModel(response: $0)
                self?.assets.append(model)
            }
            
            self?.configurate()
        }
    }
    
    private func routeTo(_ animated: Bool, onDismissed: (() -> Void)?) {
        if let vc = currentController {
            router.present(vc, animated: true)
        }
    }
    
    private func configurate() {
        self.currentController = setupController()
        self.controller?.tabBarItem = setupTabBarIcon()
    }
    
    private func setupTabBarIcon() -> UITabBarItem {
        let homeImage = UIImage(systemName: "wallet.pass.fill")
        return UITabBarItem(title: nil, image: homeImage,tag: 1)
    }
    
    private func setupController() -> UINavigationController {
        let viewModel = WalltetViewModel(assets: assets)
        let con = MyWalletViewController(self, viewModel: viewModel)
        self.controller = con
        if let UController = controller {
            return UINavigationController(rootViewController: UController)
        }
        return UINavigationController()
    }
    
    private func routeToAssetDetail(_ asset: AssetModel) {
        let current = currentController ?? UINavigationController()
        let modalRouter = ModalRouter(.custom, parentViewController: current, navigationBarIsHidden: true, showCancelButton: false)
        let coord = WalletDetailCoordinator(router: modalRouter, asset: asset)
        coord.present(animated: true, onDismissed: nil)
        
    }
    
}

extension MyWalletCoordinator: MyWalletCoordinatorNavigate {
    func navigateToAssetDetail(_ asset: AssetModel) {
        routeToAssetDetail(asset)
    }
}
