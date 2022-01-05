//
//  WalltetViewModel.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import Foundation

protocol WalltetViewModelProtocol {
    var assets: [AssetModel] { get }
}

final class WalltetViewModel: WalltetViewModelProtocol {
    
    //MARK: - Properties
    
    var assets: [AssetModel]
    
    //MARK: - Constructor
    
    init(assets: [AssetModel]) {
        self.assets = assets
    }
    
}
