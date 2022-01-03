//
//  AssetModel.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 26/12/21.
//

import Foundation
import OwnerLIB

struct AssetModel {
    
    let assetCode: String 
    let assetName: String
    let assetSegment: String
    let assetPrice: Double
    let assetQuantity: Double
    let assetType: AssetType
    
    var assetPriceFormatted: String {
        return self.assetPrice.getWithCurrencyFormatation()
    }
    
    var assetQuantityFormatted: String {
        return self.assetQuantity.getQuantityFormatation()
    }
    
    var assetAmountValue: Double {
        let result = self.assetQuantity * self.assetPrice
        return result
    }
    
    var assetAmountValueFormatted: String {
        return self.assetAmountValue.getWithCurrencyFormatation()
    }
    
}
