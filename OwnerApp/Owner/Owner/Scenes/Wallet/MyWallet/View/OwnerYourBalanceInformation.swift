//
//  OwnerYourBalanceInformation.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 26/12/21.
//

import UIKit

final class OwnerYourBalanceInformation: UIView {
    
    //MARK: - Properties
    
    private let title: String
    private let value: String
    
    //MARK: - UI Components
    
    private lazy var yourBalanceTitleLabel: UILabel = {
        let fontSize = OYBIConsts.Layout.balanceTitleFontSize
        let label = UILabel()
        label.text = self.title
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: fontSize, weight: .light)
        return label
    }()
    
    private lazy var yourBalanceValueLabel: UILabel = {
        let fontSize = OYBIConsts.Layout.balanceValueFontSize
        let label = UILabel()
        label.text = self.value
        label.textColor = .ownerBlue
        label.font = .systemFont(ofSize: fontSize, weight: .bold)
        return label
    }()
    
    private lazy var yourBalanceStackView: UIStackView = {
        let stack = UIStackView()
        
        [yourBalanceTitleLabel, UIView(), yourBalanceValueLabel]
            .forEach { stack.addArrangedSubview($0) }
        
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - Consturctor
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func commonInit() {
        configureViewHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    func configureViewHierarchy() {
        addSubview(yourBalanceStackView)
    }
    
    func configureConstraints() {
        
        yourBalanceStackView.ownerLayout.applyConstraints {
            let topDistance = OYBIConsts.Layout.balanceStackTopDistance
            let leadingDistance = OYBIConsts.Layout.balanceStackLeadingDistance
            let trailingDistance = OYBIConsts.Layout.balanceStackTrailingDistance
            
            $0.top(at: self.topAnchor, distance: topDistance)
            $0.leading(at: self.leadingAnchor, distance: leadingDistance)
            $0.trailing(at: self.trailingAnchor, distance: trailingDistance)
        }
        
        self.ownerLayout.applyConstraints {
            let bottomDistance = OYBIConsts.Layout.selfBottomDistance
            $0.bottom(at: self.yourBalanceStackView.bottomAnchor, distance: bottomDistance)
        }
        
    }
    
    func configureStyle() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}


extension OwnerYourBalanceInformation {
    struct OYBIConsts {
        private init() {}
        
        struct Layout {
            private init() {}
            
            static let balanceTitleFontSize: CGFloat = 18
            static let balanceValueFontSize: CGFloat = 22
            
            static let balanceStackTopDistance: CGFloat = 20
            static let balanceStackLeadingDistance: CGFloat = 16
            static let balanceStackTrailingDistance: CGFloat = -16
            
            static let selfBottomDistance: CGFloat = 20
        }
        
    }
}
