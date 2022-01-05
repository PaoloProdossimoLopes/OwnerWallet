//
//  WalletDetailTableViewDelegate.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 04/01/22.
//

import UIKit

typealias WDTVDProtocol = (NSObject & WalletDetailTableViewDelegateProtocol)

protocol WalletDetailTableViewDelegateProtocol: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

final class WalletDetailTableViewDelegate: WDTVDProtocol {
    
    private let vieModel: WalletDetailTableViewModelProtocol
    
    init(tableViewModel: WalletDetailTableViewModelProtocol) {
        self.vieModel = tableViewModel
    }
    
}

//MARK: - UITableViewDelegate

extension WalletDetailTableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
