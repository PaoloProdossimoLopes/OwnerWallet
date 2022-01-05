//
//  WallatDetailViewModel.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 02/01/22.
//

import Foundation

protocol WallatDetailViewModelProtocol {
    var asset: AssetModel { get }
    var listOfAssetsAproacheds: [WalletAssetAproachDetailModel] { get }
}

final class WallatDetailViewModel: WallatDetailViewModelProtocol {
    
    private(set) var asset: AssetModel
    private(set) var listOfAssetsAproacheds: [WalletAssetAproachDetailModel]
    
    init(asset: AssetModel, listOfAssetsAproacheds: [WalletAssetAproachDetailModel]) {
        self.asset = asset
        self.listOfAssetsAproacheds = listOfAssetsAproacheds
    }
    
}
