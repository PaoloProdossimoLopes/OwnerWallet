//
//  AproachView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 12/01/22.
//

import UIKit

final class AproachView: UIView {
    
    private let components: AproachViewComponents
    
    private var title: UILabel { components.titleLabel }
    
    override init(frame: CGRect) {
        self.components = .init()
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureViewHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureViewHierarchy() {
        addSubview(title)
    }
    
    private func configureConstraints() {
        title.ownerLayout.applyConstraints {
            $0.top(at: self.safeAreaLayoutGuide.topAnchor, distance: 30)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
        }
    }
    
    private func configureStyle() {
        backgroundColor = .white
    }
    
}
