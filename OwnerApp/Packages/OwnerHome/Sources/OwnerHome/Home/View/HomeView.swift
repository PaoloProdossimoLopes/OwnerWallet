//
//  HomeView.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 15/01/22.
//

import UIKit

final class HomeView: UIView {
    
    private(set) var components: HomeViewUIComponents = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        
    }
    
    private func configureConstraints() {
        
    }
    
    private func configureStyle() {
        
    }
    
}



final class HomeViewUIComponents: NSObject {
}
