//
//  WalletDetailTableViewDataSource.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 04/01/22.
//

import UIKit

typealias WDTVDSProtocol = (NSObject & WalletDetailTableViewDataSourceProtocol)

protocol WalletDetailTableViewDataSourceProtocol: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

final class WalletDetailTableViewDataSource: WDTVDSProtocol {
    
    //MARK: - Properties
    
    private let viewModel: WalletDetailTableViewModelProtocol
    
    //MARK: - Constructor
    
    init(tableViewModel: WalletDetailTableViewModelProtocol) {
        self.viewModel = tableViewModel
    }
    
}

//MARK: - UITableViewDataSource

extension WalletDetailTableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listOfAproach.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let aproachListSorted = viewModel.getListOfAproachSorted()
        let aproachModel = aproachListSorted[index]
        
        guard let cell: WalletDetailTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: WalletDetailTableViewCell.registerName, for: indexPath
        ) as? WalletDetailTableViewCell else { return UITableViewCell() }
        
        cell.setAproach(aproachModel)
        cell.selectionStyle = .none
        return cell
    }
    
}
