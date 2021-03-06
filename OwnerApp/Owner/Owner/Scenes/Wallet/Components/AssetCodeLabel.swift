//
//  AssetCodeView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import UIKit

final class AssetCodeLabel: UILabel {
    
    //MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureLabel() {
        textColor = .white
        layer.cornerRadius = 30/2
        textAlignment = .center
        backgroundColor = .ownerBlue
        font = .systemFont(ofSize: 14, weight: .black)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Setters
    
    func updateFont(font: UIFont = .systemFont(ofSize: 14, weight: .black)) {
        self.font = font 
    }
    
}
