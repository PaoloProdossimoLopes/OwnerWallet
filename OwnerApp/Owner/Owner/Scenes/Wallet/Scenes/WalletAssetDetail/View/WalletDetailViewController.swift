//
//  WalletDetailViewModel.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import UIKit

protocol WalletDetailViewControllerNavigate: AnyObject {
    func navigateToAproach()
    func navigateToBack()
}

final class WalletDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private let viewModel: WallatDetailViewModelProtocol
    weak var navigate: WalletDetailViewControllerNavigate?
    
    private lazy var detailView: WallatDetailView = {
        let view = WallatDetailView(viewModel: self.viewModel)
        view.delegate = self
        return view
    }()
    
    //MARK: - Contructos
    
    init(viewModel: WallatDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

//MARK: - WallatDetailViewDelegate
extension WalletDetailViewController: WallatDetailViewDelegate {
    
    func removeAsset(_ asset: AssetModel) {
        //TODO: Remove asset
    }
    
    func navigateToAproach() {
        navigate?.navigateToAproach()
    }
    
    func navigateToBack() {
        navigate?.navigateToBack()
    }
    
}
