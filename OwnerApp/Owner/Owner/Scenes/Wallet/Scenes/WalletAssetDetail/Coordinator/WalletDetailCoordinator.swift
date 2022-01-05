//
//  WalletDetailCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import OwnerLIB
import UIKit

final class WalletDetailCoordinator: Coordinator {
    
    //MARK: - Properties
    
    private let asset: AssetModel
    private var listOfAproached: [WalletAssetAproachDetailModel] = []
    
    //MARK: - Constructor
    
    init(_ nav: UINavigationController, asset: AssetModel = WalletMock.Asset.asset) {
        self.asset = asset
        super.init(with: nav)
    }
    
    //MARK: - Starter
    
    override func start() {
        let viewModel = WallatDetailViewModel(
            asset: self.asset, listOfAssetsAproacheds: WalletMock.Aproach.listOfAproach
        )
        let controller = WalletDetailViewController(viewModel: viewModel)
        navigationController.present(controller, animated: true, completion: nil)
    }
    
}
