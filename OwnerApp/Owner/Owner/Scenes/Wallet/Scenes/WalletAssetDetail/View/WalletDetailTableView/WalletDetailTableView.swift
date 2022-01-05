//
//  WalletDetailTableView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 04/01/22.
//

import UIKit

final class WalletDetailTableView: UITableView {
    
    //MARK: - Properties
    
    private let viewModel: WalletDetailTableViewModelProtocol
    private let WDTVDelegate: WalletDetailTableViewDelegateProtocol
    private let WDTVDDataSource: WalletDetailTableViewDataSourceProtocol
    
    //MARK: - Constructors
    
    init(viewModel: WalletDetailTableViewModelProtocol) {
        self.viewModel = viewModel
        self.WDTVDelegate = WalletDetailTableViewDelegate(tableViewModel: viewModel)
        self.WDTVDDataSource = WalletDetailTableViewDataSource(tableViewModel: viewModel)
        super.init(frame: .zero, style: .plain)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func commonInit() {
        confugureCell()
        configureDelegate()
        configureDataSource()
        configureTableView()
    }
    
    private func configureDelegate() {
        self.delegate = WDTVDelegate
    }
    
    private func configureDataSource() {
        self.dataSource = WDTVDDataSource
    }
    
    private func confugureCell() {
        register(WalletDetailTableViewCell.self,
                 forCellReuseIdentifier: WalletDetailTableViewCell.registerName)
        rowHeight = 40
    }
    
    private func configureTableView() {
        isScrollEnabled = false
        separatorColor = .clear
        backgroundColor = .clear
        tableFooterView = UIView()
    }
    
}
