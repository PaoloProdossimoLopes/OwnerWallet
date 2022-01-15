//
//  AssetModelResponse.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 14/01/22.
//

import Foundation

struct AssetModelResponse: Codable {
    
    let type: Int
    let code: String
    let name: String
    let segment: String
    let price: Double
    let quantity: Double
    let totalAmount: Double
    
    enum CodingKeys: String, CodingKey {
        case type = "asset_type"
        case code = "asset_code"
        case name = "asset_name"
        case segment = "asset_segment"
        case price = "asset_current_price"
        case quantity = "asset_quantity"
        case totalAmount = "asset_total_amount"
    }
    
}

