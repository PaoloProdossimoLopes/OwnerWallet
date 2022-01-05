//
//  AssetTableViewDelegate.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import Foundation
import UIKit

final class AssetTableViewDelegate: NSObject {
    
    //MARK: - Properties
    
    private let controller: UIViewController
    private let assets: [AssetModel]
    weak var navigateDelegate: AssetTableViewNavigateDelegate?
    
    //MARK: - Constructor
    
    init(_ contorller: UIViewController, assets: [AssetModel]) {
        self.controller = contorller
        self.assets = assets
    }
    
}

//MARK: - UITableViewDelegate

extension AssetTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        //showDetailModalView(at: indexPath)
        navigateToAssetDetailView(at: indexPath)
    }
    
    private func showDetailModalView(at indexPath: IndexPath) {
        let model = assets[indexPath.row]
        let detailView: AssetDetailModalView = .init(from: controller, asset: model)
        detailView.show()
    }
    
    private func navigateToAssetDetailView(at indexPath: IndexPath) {
        let model = assets[indexPath.row]
        self.navigateDelegate?.navigateToAssetDetail(model)
    }
    
}
