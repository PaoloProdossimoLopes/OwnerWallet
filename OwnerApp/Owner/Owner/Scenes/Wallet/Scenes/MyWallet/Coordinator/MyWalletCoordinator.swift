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
    
    weak var navigateDelegate: OwnerWalletCoordinatorNavigate?
    
    var currentViewController: UINavigationController = .init()
    private var assets: [AssetModel] = []
    
    private let service: MyWalletAPI = .shared
    
    init(navigation: UINavigationController) {
        super.init(with: navigation)
    }
    
    override func start() {
        callAPI()
    }
    
    private func callAPI() {
        service.fetchListOfAssets { [weak self] reponseList in
            reponseList.forEach {
                let model = AssetModel(response: $0)
                self?.assets.append(model)
            }
            
            showWalletView()
        }
    }
    
    private func showWalletView() {
        let viewModel = WalltetViewModel(assets: assets)
        let viewController = MyWalletViewController(viewModel: viewModel)
        
        viewController.navigateDelegate = self
        
        let navigation = UINavigationController(rootViewController: viewController)
        self.currentViewController = navigation
    }
    
}

extension MyWalletCoordinator: MyWalletCoordinatorNavigate {
    func navigateToAssetDetail(_ asset: AssetModel) {
        navigateDelegate?.navigateToDetail(asset)
    }
}
