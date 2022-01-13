//
//  AproachView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 12/01/22.
//

import UIKit

final class AproachView: UIView {
    
    //MARK: - Properties
    
    private let components: AproachViewComponents
    private let controller: AproachViewController
    
    //MARK: - UI Components ref
    
    private(set) lazy var title = components.titleLabel
    private(set) lazy var aproachButton = components.aproachButton
    
    init(_ controller: AproachViewController) {
        self.controller = controller
        self.components = .init()
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureViewHierarchy()
        configureConstraints()
        configureStyle()
        configureButton()
    }
    
    private func configureViewHierarchy() {
        addSubview(title)
        addSubview(aproachButton)
    }
    
    private func configureConstraints() {
        title.ownerLayout.applyConstraints {
            $0.top(at: self.safeAreaLayoutGuide.topAnchor, distance: 30)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
        }
        
        aproachButton.ownerLayout.applyConstraints {
            $0.bottom(at: self.safeAreaLayoutGuide.bottomAnchor, distance: -20)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
        }
    }
    
    private func configureStyle() {
        backgroundColor = .white
    }
    
    private func configureButton() {
        aproachButton.addTarget(self,
                                action: #selector(aproachButtonActionHandleTapped),
                                for: .touchUpInside)
    }
    
    @objc private func aproachButtonActionHandleTapped() {
        print("Tap")
    }
    
}
