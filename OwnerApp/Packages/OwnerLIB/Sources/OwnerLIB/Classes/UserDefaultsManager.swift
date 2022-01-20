//
//  File.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 19/01/22.
//

import Foundation

public struct UserDefaultsManagerKeys {
    
    enum Classes: String {
        case user
    }
    
}

public class UserDefaultsManager: NSObject {
    
    public static let shared: UserDefaultsManager = .init()
    private let UDefaults = UserDefaults.standard
    
    private override init() { super.init() }
    
    //MARK: Custom Classes
    func set<T: Encodable>(_ key: UserDefaultsManagerKeys.Classes, data: T) {
        let data = try? JSONEncoder().encode(data)
        UDefaults.setValue(data, forKey: key.rawValue)  
    }
    
    func get<T: Decodable>(
        type expect: T.Type, key: UserDefaultsManagerKeys.Classes
    ) -> T? {
        if let data = UDefaults.object(forKey: key.rawValue) as? Data {
            let user = try? JSONDecoder().decode(expect.self, from: data)
            return user
        }
        return nil
    }
    
    func remove(_ key: UserDefaultsManagerKeys.Classes) {
        UDefaults.removeObject(forKey: key.rawValue)
    }
    
}
