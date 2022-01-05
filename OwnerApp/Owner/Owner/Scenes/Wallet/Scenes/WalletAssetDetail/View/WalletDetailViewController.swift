//
//  WalletDetailViewModel.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import UIKit

final class WalletDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private let viewModel: WallatDetailViewModelProtocol
    
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
        commonInit()
    }
    
    //MARK: - Helpers
    
    private func commonInit() {
        configureViewHierachy()
        configureConstraints()
        configureStyle()
    }
    
    func configureViewHierachy() {
        
    }
    
    func configureConstraints() {
        
    }
    
    func configureStyle() {
        
    }
    
}

//MARK: - WallatDetailViewDelegate
extension WalletDetailViewController: WallatDetailViewDelegate {
    
}
