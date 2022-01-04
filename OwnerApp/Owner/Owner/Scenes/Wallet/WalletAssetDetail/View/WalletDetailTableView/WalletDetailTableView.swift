//
//  WalletDetailTableView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 04/01/22.
//

import UIKit

final class WalletDetailTableView: UITableView {
    
    private let WDTVDelegate: WalletDetailTableViewDelegate = .init()
    private let WDTVDDataSource: WalletDetailTableViewDataSource = .init()
    
    init() {
        super.init(frame: .zero, style: .plain)
        commonInit()
    }
    
    private func commonInit() {
        configureDelegate()
        configureDataSource()
    }
    
    private func configureDelegate() {
        self.delegate = WDTVDelegate
    }
    
    private func configureDataSource() {
        self.dataSource = WDTVDDataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
