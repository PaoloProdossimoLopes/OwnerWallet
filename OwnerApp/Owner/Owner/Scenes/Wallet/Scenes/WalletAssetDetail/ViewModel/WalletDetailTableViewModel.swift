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
    
    func getListOfAproachSorted() -> [WalletAssetAproachDetailModel]
}

final class WalletDetailTableViewModel: WalletDetailTableViewModelProtocol {
    
    //MARK: - Properties
    
    private(set) var listOfAproach: [WalletAssetAproachDetailModel]
    private(set) var assetModel: AssetModel
    
    //MARK: - Constructor
    
    init(assetModel: AssetModel, listOfAproach: [WalletAssetAproachDetailModel]) {
        self.assetModel = assetModel
        self.listOfAproach = listOfAproach
    }
    
    //MARK: - Getters
    
    func getListOfAproachSorted() -> [WalletAssetAproachDetailModel] {
        var new = listOfAproach
        new.sort { $0.dateOfAproach > $1.dateOfAproach }
        return new
    }
    
}
