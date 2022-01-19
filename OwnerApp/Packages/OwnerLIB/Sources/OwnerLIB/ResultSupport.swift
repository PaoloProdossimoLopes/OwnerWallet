//
//  ResultSupport.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 18/01/22.
//

import Foundation

public enum ResultSupport<T> {
    case success(T)
    case failure(Error)
}

public extension ResultSupport where T == Void {
    
    static func success() -> ResultSupport {
        return .success(())
    }
    
}
