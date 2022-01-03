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
    
    private lazy var assetCodeLabel: AssetCodeLabel = {
        let label = AssetCodeLabel()
        label.text = viewModel.asset.assetCode
        label.layer.cornerRadius = 40/2
        label.updateFont(font: .systemFont(ofSize: 20, weight: .black))
        return label
    }()
    
    private lazy var assetNameLabel: UILabel = {
        let label = UILabel()
        label.text = self.viewModel.asset.assetName
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private lazy var assetSegmentLabel: UILabel = {
        let label = UILabel()
        label.text = self.viewModel.asset.assetSegment
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var assetNameAndSegmentStackView: UIStackView = {
        let subviews = [assetNameLabel, assetSegmentLabel]
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    //Amount
    private lazy var assetAmountTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Patrimônio"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var assetAmmountValueLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.asset.assetAmountValueFormatted
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .ownerBlue
        label.textAlignment = .right
        return label
    }()
    
    private lazy var assetAmmountHorizontalStackView: UIStackView = {
        let subviews = [assetAmountTitleLabel, UIView(), assetAmmountValueLabel]
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = .horizontal
        return stack
    }()
    
    //Quantity
    private lazy var assetQuantityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantidade"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var assetQuantityValueLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.asset.assetQuantityFormatted
        return label
    }()
    
    private lazy var assetQuantityVerticalStackView: UIStackView = {
        let subviews =  [assetQuantityTitleLabel, assetQuantityValueLabel]
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    //CurentPrice
    private lazy var assetCurentPriceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cotação"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var assetCurentPriceValueLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.asset.assetPriceFormatted
        return label
    }()
    
    private lazy var assetCurentPriceVerticalStackView: UIStackView = {
        let subviews = [assetCurentPriceTitleLabel, assetCurentPriceValueLabel]
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    //Main Horixontal stack
    private lazy var assetHorizontalStackView: UIStackView = {
        let subviews = [assetQuantityVerticalStackView, assetCurentPriceVerticalStackView]
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    //MARK: - Constructor
    
    init(viewModel: WallatDetailViewModelProtocol) {
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
        addSubview(topViewDetailModalIndicator)
        addSubview(assetCodeLabel)
        addSubview(assetNameAndSegmentStackView)
        addSubview(assetAmmountHorizontalStackView)
        addSubview(assetHorizontalStackView)
    }
    
    private func configureConstarints() {
        
        topViewDetailModalIndicator.ownerLayout.applyConstraints {
            $0.centerX(at: self.centerXAnchor)
            $0.top(at: self.topAnchor, distance: 10)
            $0.height(WDVConst.Layout.topIndicatorHeight)
            $0.width(WDVConst.Layout.topIndicatorWidth)
        }
        
        assetCodeLabel.ownerLayout.applyConstraints {
            $0.top(at: topViewDetailModalIndicator.bottomAnchor, distance: 20)
            $0.centerX(at: self.centerXAnchor)
            $0.height(40)
            $0.width(3*40)
        }
        
        assetNameAndSegmentStackView.ownerLayout.applyConstraints {
            $0.top(at: self.assetCodeLabel.bottomAnchor, distance: 20)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
        }
        
        assetAmmountHorizontalStackView.ownerLayout.applyConstraints {
            $0.top(at: self.assetNameAndSegmentStackView.bottomAnchor, distance: 30)
            $0.leading(at: self.leadingAnchor, distance: 30)
            $0.trailing(at: self.trailingAnchor, distance: -30)
        }
        
        assetHorizontalStackView.ownerLayout.applyConstraints {
            $0.top(at: self.assetAmmountHorizontalStackView.bottomAnchor, distance: 30)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
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
