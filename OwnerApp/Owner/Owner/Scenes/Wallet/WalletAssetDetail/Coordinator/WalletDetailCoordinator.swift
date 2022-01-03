//
//  WalletDetailCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import OwnerLIB
import UIKit

final class WalletDetailCoordinator: Coordinator {
    
    private let asset: AssetModel
    
    init(_ nav: UINavigationController, asset: AssetModel = WalletMock.Asset.asset) {
        self.asset = asset
        super.init(with: nav)
    }
    
    override func start() {
        let viewModel = WallatDetailViewModel(asset: self.asset)
        let controller = WalletDetailViewController(viewModel: viewModel)
        navigationController.present(controller, animated: true, completion: nil)
    }
    
}
