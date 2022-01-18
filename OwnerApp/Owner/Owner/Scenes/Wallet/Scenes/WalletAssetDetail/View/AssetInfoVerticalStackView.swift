//
//  AssetInfoVerticalStackView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 05/01/22.
//

import UIKit

final class AssetInfoVerticalStackView: UIStackView {
    
    private let title: String
    private let subtitle: String
    
    private lazy var assetQuantityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var assetQuantityValueLabel: UILabel = {
        let label = UILabel()
        label.text = subtitle
        label.textColor = .black
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
        confugureStyle()
    }
    
    private func configureViewHierarchy() {
        [assetQuantityTitleLabel, assetQuantityValueLabel]
            .forEach { self.addArrangedSubview($0) }
    }
    
    private func confugureStyle() {
        axis = .vertical
        alignment = .center
    }
    
}
