//
//  AssetHorizontalWithVerticalStackView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 05/01/22.
//

import UIKit

final class AssetHorizontalWithVerticalStackView: UIStackView {
    
    private let listOfAssetVStackViewModel: [AssetVStackViewModel]
    private var listOfStacks: [AssetInfoVerticalStackView] = []
    
    init(listOfAssetVStackViewModel: [AssetVStackViewModel]) {
        self.listOfAssetVStackViewModel = listOfAssetVStackViewModel
        super.init(frame: .zero)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        listOfAssetVStackViewModel
            .forEach { model in self.listOfStacks
            .append(AssetInfoVerticalStackView(title: model.title, subtitle: model.subtitle))
        }
        
        listOfStacks.forEach {
            self.addArrangedSubview($0)
        }
        
        axis = .horizontal
        distribution = .fillEqually
        
    }
    
}
