//
//  MyWalletAPI.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 14/01/22.
//

import Foundation
import OwnerLIB

typealias MWAPIProtocol = (NSObject & MyWalletAPIProtocol)

protocol MyWalletAPIProtocol {
    func getAsset(_ completion: (AssetModelResponse) -> Void)
}

final class MyWalletAPI: MWAPIProtocol {
    
    static let shared: MyWalletAPI = .init()
    
    private override init() {}
    
    func getAsset(_ completion: (AssetModelResponse) -> Void) {
        let mock = self.mockDecoder(type: AssetModelResponse.self,
                                    from: "AssetAPIDefaultJSONResponseMock.json")
        completion(mock)
        
        //TODO: Make a real request and callback a result type
    }
    
    func fetchListOfAssets(_ completion: ([AssetModelResponse]) -> Void) {
        let mock = self.mockDecoder(type: [AssetModelResponse].self,
                                    from: "ListOfAssetAPIDefaultJSONResponseMock.json")
        completion(mock)
    }
    
}
