//
//  AssetModel.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 26/12/21.
//

import Foundation
import OwnerLIB

struct AssetModel {
    
    //MARK: - Initializer properties
    
    let assetCode: String 
    let assetName: String
    let assetSegment: String
    let assetPrice: Double
    let assetQuantity: Double
    let assetType: AssetType
    
    init(response: AssetModelResponse) {
        self.assetCode = response.code
        self.assetName = response.name
        self.assetSegment = response.segment
        self.assetPrice = response.price
        self.assetQuantity = response.quantity
        self.assetType = .init(rawValue: response.type) ?? .BRStocks
    }
    
    //MARK: - Computed properties
    
    var assetPriceFormatted: String {
        return self.assetPrice.getWithCurrencyFormatation()
    }
    
    var assetQuantityFormatted: String {
        return self.assetQuantity.getQuantityFormatation()
    }
    
    var assetAmountValue: Double {
        return (self.assetQuantity * self.assetPrice)
    }
    
    var assetAbreviateAmountValueForatted: String {
        return self.assetAmountValue.getCurrencyWithAbreviateFormatation()
    }
    
    var assetAmountValueFormatted: String {
        return self.assetAmountValue.getWithCurrencyFormatation()
    }
    
}
