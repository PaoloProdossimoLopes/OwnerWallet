//
//  AssetAmountInformationHorizontalStackView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 04/01/22.
//

import UIKit

final class AssetAmountInformationHorizontalStackView: UIStackView {
    
    private let title: String
    private let subtitle: String
    
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
        label.text = subtitle
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .ownerBlue
        label.textAlignment = .right
        return label
    }()
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        super.init(frame: .zero)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureViewHierarchy()
        configureStyle()
    }
    
    private func configureViewHierarchy() {
        [assetAmountTitleLabel, UIView(), assetAmmountValueLabel]
            .forEach { self.addArrangedSubview($0) }
    }
    
    private func configureStyle() {
        axis = .horizontal
    }
    
}
