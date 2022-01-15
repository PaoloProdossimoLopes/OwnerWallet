//
//  ListOfMainAssets.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 15/01/22.
//

import Foundation

struct ListOfMainAssets: Codable {
    
    let assetCode: String
    let assetName: String
    let assetSegment: String
    let assetImage: String
    
    enum CodingKeys: String, CodingKey {
        case assetCode = "code"
        case assetName = "name"
        case assetSegment = "segment"
        case assetImage = "image"
    }
    
}
