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
    
    init(response: ListOfAproachsResponse) {
        self.dateOfAproach = response.date
        self.valueOfAssetAproach = response.value
        self.quantityOfAssets = response.quantity
    }
    
    //MARK: - Computed properties
    
    var quantityOfAssetsFormatted: String {
        return quantityOfAssets.getQuantityFormatationWithUnit()
    }
    
    var valueOfAproachFormatted: String {
        return valueOfAssetAproach.getCurrencyWithAbreviateFormatation()
    }
    
    var dateFormatted: String {
        return dateOfAproach.formatterToBrazilianDate()
    }
    
}
