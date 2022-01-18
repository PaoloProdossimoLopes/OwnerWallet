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
    
    //MARK: - Properties
    
    private let vieModel: WalletDetailTableViewModelProtocol
    
    //MARK: - COnstructor
    
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
