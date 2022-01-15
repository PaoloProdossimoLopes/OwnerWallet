//
//  RequestProtocol.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 15/01/22.
//

import Foundation

public protocol RequestProtocol {
    
    var autoDescribing: String { get }
    var urlString: String { get }
    var body: String? { get }
    
}

public extension RequestProtocol {
    
    var body: String? { return nil }
    
}

