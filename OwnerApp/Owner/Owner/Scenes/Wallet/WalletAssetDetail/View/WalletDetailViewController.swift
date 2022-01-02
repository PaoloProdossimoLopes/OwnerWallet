//
//  WalletDetailViewModel.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import UIKit

final class WalletDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private lazy var detailView: WallatDetailView = {
        let view = WallatDetailView()
        return view
    }()
    
    
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
