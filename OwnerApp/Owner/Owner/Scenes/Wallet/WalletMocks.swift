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
               assetSegment: "Bancos",
               assetPrice: 70,
               assetQuantity: 250, assetType: .BRStocks),
    
    AssetModel(assetCode: "AMT",
               assetName: "American Tower",
               assetSegment: "REIT - Specialty",
               assetPrice: 34.23,
               assetQuantity: 1.434, assetType: .REITs),
    
    AssetModel(assetCode: "HGLG11",
               assetName: "CSHG Logística",
               assetSegment: "Logística",
               assetPrice: 123.1231,
               assetQuantity: 4, assetType: .FIIs),
    
    AssetModel(assetCode: "MSFT",
               assetName: "Microsoft",
               assetSegment: "Software - Infrastructure",
               assetPrice: 2302.312,
               assetQuantity: 0.23, assetType: .USAStocks)
]

