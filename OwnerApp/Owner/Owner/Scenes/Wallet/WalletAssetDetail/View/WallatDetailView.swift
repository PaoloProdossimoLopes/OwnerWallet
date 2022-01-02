//
//  WallatDetailView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 02/01/22.
//

import UIKit
import OwnerLIB

protocol WallatDetailViewDelegate: AnyObject {
    
}

final class WallatDetailView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: WallatDetailViewDelegate?
    
    private let viewModel: WallatDetailViewModelProtocol
    
    //MARK: - UI Components
    
    private lazy var topViewDetailModalIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = WDVConst.Layout.topIndicatorHeight/2
        return view
    }()
    
    
    //MARK: - Constructor
    
    init(viewModel: WallatDetailViewModelProtocol = WallatDetailViewModel()) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func commonInit() {
        configureViewHierarchy()
        configureConstarints()
        configureStyle()
    }
    
    private func configureViewHierarchy() {
        self.addSubview(topViewDetailModalIndicator)
    }
    
    private func configureConstarints() {
        topViewDetailModalIndicator.ownerLayout.applyConstraints {
            $0.centerX(at: self.centerXAnchor)
            $0.top(at: self.topAnchor, distance: 10)
            $0.height(WDVConst.Layout.topIndicatorHeight)
            $0.width(WDVConst.Layout.topIndicatorWidth)
        }
    }
    
    private func configureStyle() {
        self.backgroundColor = .white
    }
    
    //MARK: - Selectors
    
}


//MARK: - WDVConst

extension WallatDetailView {
private struct WDVConst {
    private init() {}
    
    struct Layout {
        private init() {}
        static let topIndicatorHeight: CGFloat = 10
        static let topIndicatorWidth: CGFloat = 50
    }
        
}}
