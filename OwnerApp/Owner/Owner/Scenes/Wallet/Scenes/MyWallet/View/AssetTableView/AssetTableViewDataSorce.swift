//
//  AssetTableViewDataSorce.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import UIKit

typealias ATBVDSProtocol = (NSObject & AssetTableViewDataSorceProtocol)

protocol AssetTableViewDataSorceProtocol: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

final class AssetTableViewDataSorce: ATBVDSProtocol {
    
    //MARK: - Properties
    
    private let assets: [AssetModel]
    
    //MARK: - Constructor
    
    init(assets: [AssetModel]) {
        self.assets = assets
    }
    
    //MARK: - Helpers
    
    private func createCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AssetTableViewCell.registerName, for: indexPath
        ) as? AssetTableViewCell else { return defaultCell }
        
        let assetModel = assets[indexPath.row]
        cell.setAssetInformations(asset: assetModel)
        cell.selectionStyle = .none
        
        return cell
    }

}

//MARK: - UITableViewDataSource

extension AssetTableViewDataSorce {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = createCell(tableView: tableView, indexPath: indexPath)
        return cell
    }
    
}
