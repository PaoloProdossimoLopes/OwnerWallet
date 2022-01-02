//
//  WalletMocks.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import Foundation

//MARK: - Structs

struct WalletMock {
    
    struct Asset {
        static let lisOfAsset = listOfAssetMock
        static let asset = listOfAssetMock.first!
    }
    
    
}

//MARK: - Mock properties

fileprivate let listOfAssetMock: [AssetModel] = [
    AssetModel(assetCode: "ITUB3",
               assetName: "Itau unibanco BBA",
               assetSegment: "BANK",
               assetPrice: "R$ 200,00",
               assetQuantity: "10", assetType: .BRStocks),
    
    AssetModel(assetCode: "IVVB11",
               assetName: "Itau unibanco BBA",
               assetSegment: "BANK",
               assetPrice: "R$ 200,00",
               assetQuantity: "10", assetType: .FIIs),
    
    AssetModel(assetCode: "ITUB3",
               assetName: "Itau unibanco BBA",
               assetSegment: "BANK",
               assetPrice: "R$ 200,00",
               assetQuantity: "10", assetType: .BRStocks),
    
    AssetModel(assetCode: "ITUB3",
               assetName: "Itau unibanco BBA",
               assetSegment: "BANK",
               assetPrice: "R$ 200,00",
               assetQuantity: "10", assetType: .USAStocks)
]

