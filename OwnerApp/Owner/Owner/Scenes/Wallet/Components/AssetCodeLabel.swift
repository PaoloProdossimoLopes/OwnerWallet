//
//  AssetCodeView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import UIKit

final class AssetCodeLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        textColor = .white
        layer.cornerRadius = 30/2
        textAlignment = .center
        backgroundColor = .ownerBlue
        font = .systemFont(ofSize: 14, weight: .black)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
