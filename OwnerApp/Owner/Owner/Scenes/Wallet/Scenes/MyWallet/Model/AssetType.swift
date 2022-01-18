//
//  AssetType.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 02/01/22.
//

import Foundation

enum AssetType: Int {
    
    //MARK: - Cases
    
    case USAStocks = 1
    case BRStocks = 2
    case FIIs = 3
    case REITs = 4
    
}

extension AssetType {
    
    //MARK: - Computed properties
    
    var withDescription: String {
        switch self {
            case .USAStocks: return "Stock"
            case .BRStocks: return "Ação"
            case .FIIs: return "FIIs"
            case .REITs: return "REITs"
        }
    }
    
}
