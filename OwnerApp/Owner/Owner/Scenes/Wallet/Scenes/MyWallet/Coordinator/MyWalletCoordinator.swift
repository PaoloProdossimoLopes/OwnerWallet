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
    
    var currentViewController: UINavigationController = .init()
    var asset: AssetModel
    
    weak var navigateDelegate: OwnerWalletCoordinatorNavigate?
    
    init(navigation: UINavigationController, asset: AssetModel = WalletMock.Asset.asset) {
        self.asset = asset
        super.init(with: navigation)
    }
    
    override func start() {
        let assets: [AssetModel] =  WalletMock.Asset.lisOfAsset
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
