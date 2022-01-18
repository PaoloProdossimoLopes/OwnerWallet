//
//  WalletAssetDetailAPI.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 14/01/22.
//

import Foundation

typealias WADAPIProtocol = (NSObject & WalletAssetDetailAPIProtocol)

protocol WalletAssetDetailAPIProtocol {
    func fetchListOfAproacheds(_ completion: ([ListOfAproachsResponse]) -> Void)
}

final class WalletAssetDetailAPI: WADAPIProtocol {
    
    static let shared: WalletAssetDetailAPI = .init()
    
    private override init() {}
    
    func fetchListOfAproacheds(_ completion: ([ListOfAproachsResponse]) -> Void) {
        
        let mock = self.mockDecoder(type: [ListOfAproachsResponse].self,
                                    from: "AssetAproachds.json")
        completion(mock)
        
    }
    
}
