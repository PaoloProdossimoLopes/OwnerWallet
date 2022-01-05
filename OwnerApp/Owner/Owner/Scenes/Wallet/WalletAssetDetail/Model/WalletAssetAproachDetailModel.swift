//
//  WalletAssetAproachDetailModel.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 04/01/22.
//

import Foundation
import OwnerLIB

struct WalletAssetAproachDetailModel {
    
    let dateOfAproach: String
    let valueOfAssetAproach: Double
    let quantityOfAssets: Double
    
    var quantityOfAssetsFormatted: String {
        return quantityOfAssets.getQuantityFormatation()
    }
    
    var valueOfAproachFormatted: String {
        return valueOfAssetAproach.getWithCurrencyFormatation()
    }
    
    var dateFormatted: String {
        return dateOfAproach.formatterToBrazilianDate()
    }
    
}
