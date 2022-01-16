//
//  File.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 15/01/22.
//

import Foundation

final class HomeViewModel {
    
    private let service: HomeAPI = .shared
    
    private(set) var assets: [ListOfMainAssets] = []
    private(set) var assetsFieltered: [ListOfMainAssets] = []
    
    var updateView: (() -> Void)?
    
    func fetchAssets() {
        service.fetchAssets { [weak self] assets in
            guard let self = self else { return }
            
            assets.forEach { self.assets.append($0) }
            
            self.assetsFieltered = self.assets
            self.updateView?()
        }
    }
    
    func updateList(text: String) {
        
        let list = filterAsset(text)
        
        let isNotEmpty: Bool = (list.isEmpty == false),
            isEmptyAndTextNotIsEmpty: Bool = (list.isEmpty && text != "")
        
        if isNotEmpty { self.assetsFieltered = list }
        else if isEmptyAndTextNotIsEmpty { self.assetsFieltered = [] }
        else { self.assetsFieltered = self.assets }
        
        updateView?()
    }
    
    func resetList() {
        self.assetsFieltered = self.assets
        updateView?()
    }
    
    private func filterAsset(_ text: String) -> [ListOfMainAssets] {
        let list = assets.filter({ asset in
            
            let textLowercased: String = text.lowercased()
            let assetName: String = asset.assetName.lowercased()
            let assetCode: String = asset.assetCode.lowercased()
            
            let nameContains: Bool = assetName.contains(textLowercased)
            let codeContains: Bool = assetCode.contains(textLowercased)
            
            if (nameContains || codeContains) { return true }
            else { return false }
        })
        
        return list
    }
    
}
