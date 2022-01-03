//
//  WallatDetailViewModel.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 02/01/22.
//

import Foundation

protocol WallatDetailViewModelProtocol {
    var asset: AssetModel { get }
}

final class WallatDetailViewModel: WallatDetailViewModelProtocol {
    
    var asset: AssetModel
    
    init(asset: AssetModel) {
        self.asset = asset
    }
    
}
