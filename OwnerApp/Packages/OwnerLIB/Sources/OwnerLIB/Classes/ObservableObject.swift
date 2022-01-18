//
//  ObservableObject.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 18/01/22.
//

import Foundation

public class ObservableObject<T> {
    
    public typealias ObservableCallback = ((T) -> Void)
    
    //public private(set) var value: T { didSet {  listener?(value) } }
    public private(set) var value: T
    private var listener: ObservableCallback?
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(_ listener: @escaping ObservableCallback) {
        listener(value)
        self.listener = listener
    }
    
    public func fire(_ value: T) {
        self.value = value
        listener?(value)
    }
    
}

//Extenions for enable void type
public extension ObservableObject where T == Void {
    convenience init() { self.init(()) }
    func fire() { listener?(value) }
}
