//
//  WalletAssetAproachDetailModel.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 04/01/22.
//

import Foundation
import OwnerLIB

struct WalletAssetAproachDetailModel {
    
    //MARK: - Initializer properties
    
    let dateOfAproach: String
    let valueOfAssetAproach: Double
    let quantityOfAssets: Double
    
    //MARK: - Computed properties
    
    var quantityOfAssetsFormatted: String {
        return quantityOfAssets.getQuantityFormatationWithUnit()
    }
    
    var valueOfAproachFormatted: String {
        return valueOfAssetAproach.getWithCurrencyFormatation()
    }
    
    var dateFormatted: String {
        return dateOfAproach.formatterToBrazilianDate()
    }
    
}
