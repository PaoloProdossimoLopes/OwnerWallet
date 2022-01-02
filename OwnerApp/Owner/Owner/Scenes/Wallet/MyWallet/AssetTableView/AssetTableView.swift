//
//  AssetTableView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import UIKit

protocol AssetTableViewNavigateDelegate: AnyObject {
    func navigateToAssetDetail(_ asset: AssetModel)
}

final class AssetTableView: UITableView {
    
    //MARK: - Properties
    
    let controller: MyWalletViewController
    let listofAssets: [AssetModel]
    
    private lazy var assetDataSource: AssetTableViewDataSorce = .init(
        assets: listofAssets
    )
    private lazy var assetDelegate: AssetTableViewDelegate = .init(
        controller, assets: listofAssets
    )
    
    weak var navigateDelegate: MyWalletViewControllerNavigateDelegate?
    
    //MARK: - Constructor
    
    init(_ controller: MyWalletViewController, listOf assets: [AssetModel]) {
        self.controller = controller
        self.listofAssets = assets
        super.init(frame: .zero, style: .plain)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configurators
    
    private func commonInit() {
        configureStyle()
        configureCell()
        configureDelegate()
        configureDataSource()
    }
    
    private func configureStyle() {
        tableFooterView = UIView()
        separatorColor = .clear
        backgroundColor = .clear
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDelegate() {
        delegate = assetDelegate
        assetDelegate.navigateDelegate = self
    }
    
    private func configureDataSource() {
        dataSource = assetDataSource
    }
    
    private func configureCell() {
        register(AssetTableViewCell.self, forCellReuseIdentifier: AssetTableViewCell.registerName)
        rowHeight = 60
    }
    
}

extension AssetTableView: AssetTableViewNavigateDelegate {
    func navigateToAssetDetail(_ asset: AssetModel) {
        self.navigateDelegate?.navigateToAssetDetail(asset)
    }
}
