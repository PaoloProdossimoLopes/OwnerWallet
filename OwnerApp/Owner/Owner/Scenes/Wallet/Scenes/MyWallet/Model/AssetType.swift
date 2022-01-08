//
//  AssetType.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 02/01/22.
//

import Foundation

enum AssetType {
    
    //MARK: - Cases
    
    case USAStocks
    case BRStocks
    case FIIs
    case REITs
    
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
