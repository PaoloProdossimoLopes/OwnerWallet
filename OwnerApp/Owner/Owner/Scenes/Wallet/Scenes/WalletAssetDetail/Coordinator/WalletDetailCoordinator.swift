//
//  WalletDetailCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import OwnerLIB
import UIKit

final class WalletDetailCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    var router: Router
    
    private var currentController: UIViewController = .init()
    private let asset: AssetModel
    private var listOfAproached: [WalletAssetAproachDetailModel] = []
    
    private let service: WalletAssetDetailAPI = .shared
    
    init(router: Router, asset: AssetModel) {
        self.asset = asset
        self.router = router
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        callAPI() {
            self.routeToDetail()
        }
    }
    
    private func callAPI(_ completion: () -> Void) {
        service.fetchListOfAproacheds { [weak self] reponseList in
            reponseList.forEach { response in
                let model = WalletAssetAproachDetailModel(response: response)
                self?.listOfAproached.append(model)
            }
            
            completion()
        }
    }
    
    private func routeToDetail() {
        let viewModel = WallatDetailViewModel(
            asset: asset, listOfAssetsAproacheds: listOfAproached
        )
        let controller = WalletDetailViewController(self, viewModel: viewModel)
        
        currentController = controller
        router.present(controller, animated: true)
    }
    
    func routeToAprach() {
        let aproachCoordinator = AproachCoordinator(router: router)
        presentChild(aproachCoordinator, animated: true, onDismissed: nil)
    }
    
}

extension WalletDetailCoordinator: WalletDetailViewControllerNavigate {
    func navigateToAproach() {
        routeToAprach()
    }
    
    func navigateToBack() {
        dismiss(animated: true)
    }
}
