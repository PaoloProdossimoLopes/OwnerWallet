//
//  ListOfMainAssets.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 15/01/22.
//

import Foundation
import UIKit

struct ListOfMainAssets: Codable {
    
    let assetCode: String
    let assetName: String
    let assetSegment: String
    let assetDescription: String
    let assetImage: String
    
    enum CodingKeys: String, CodingKey {
        case assetCode = "code"
        case assetName = "name"
        case assetSegment = "segment"
        case assetDescription = "description"
        case assetImage = "image"
    }
    
    var image: UIImage? {
        guard let url = URL(string: assetImage) else { return nil }
        let data = try? Data(contentsOf: url)
        let image = UIImage(data: data!)
        return image
    }
    
}
