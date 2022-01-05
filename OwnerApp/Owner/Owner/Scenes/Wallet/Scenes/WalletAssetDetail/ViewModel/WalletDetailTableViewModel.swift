//
//  WalletDetailTableViewModel.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 04/01/22.
//

import Foundation

protocol WalletDetailTableViewModelProtocol {
    var listOfAproach: [WalletAssetAproachDetailModel] { get }
    var assetModel: AssetModel { get }
    
}

final class WalletDetailTableViewModel: WalletDetailTableViewModelProtocol {
    
    private(set) var listOfAproach: [WalletAssetAproachDetailModel]
    private(set) var assetModel: AssetModel
    
    init(assetModel: AssetModel, listOfAproach: [WalletAssetAproachDetailModel]) {
        self.assetModel = assetModel
        self.listOfAproach = listOfAproach
    }
    
}
