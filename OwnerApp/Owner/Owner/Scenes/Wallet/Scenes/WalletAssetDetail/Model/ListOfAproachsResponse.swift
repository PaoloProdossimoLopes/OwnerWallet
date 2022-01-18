//
//  ListOfAproachsResponse.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 14/01/22.
//

import Foundation

struct ListOfAproachsResponse: Codable {
    
    let date: String
    let value: Double
    let quantity: Double
    
    enum CodingKeys: String, CodingKey {
        case date = "aprach_date"
        case value = "aproach_value"
        case quantity = "aproachQuantity"
    }
    
}
