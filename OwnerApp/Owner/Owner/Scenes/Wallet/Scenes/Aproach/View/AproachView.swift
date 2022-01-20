//
//  AproachView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 12/01/22.
//

import UIKit

protocol AproachViewDelegate: AnyObject {
    func aprachButtonWasTapped()
    func closeButtonWasTapped()
}

final class AproachView: UIView {
    
    //MARK: - Properties
    
    private var components: AproachViewComponents
    private let controller: AproachViewController
    
    var delegate: AproachViewDelegate?
    
    //MARK: - Constructor
    
    init(_ controller: AproachViewController) {
        self.controller = controller
        self.components = .init()
        super.init(frame: .zero)
        components.delegate = self
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
        configureButton()
    }
    
    private func configureViewHierarchy() {
        [components.assetHStackView, components.assetPriceTF, components.assetDateTF,
         components.assetQuantityTF, UIView()]
            .forEach { components.mainTextViewStackView.addArrangedSubview($0) }
        
        addSubview(components.closeButton)
        addSubview(components.titleLabel)
        addSubview(components.mainTextViewStackView)
        addSubview(components.aproachButton)
    }
    
    private func configureConstraints() {
        components.titleLabel.ownerLayout.applyConstraints {
            $0.top(at: self.safeAreaLayoutGuide.topAnchor, distance: 30)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
        }
        
        components.closeButton.ownerLayout.applyConstraints {
            $0.centerY(at: components.titleLabel.centerYAnchor)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.height(36)
            $0.width(36)
        }
        
        components.mainTextViewStackView.ownerLayout.applyConstraints {
            $0.top(at: self.components.titleLabel.bottomAnchor, distance: 20)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
            $0.bottom(at: self.components.aproachButton.topAnchor, distance: -20)
        }
        
        components.aproachButton.ownerLayout.applyConstraints {
            $0.bottom(at: self.safeAreaLayoutGuide.bottomAnchor, distance: -20)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
            $0.height(40)
        }
        
        components.assetCodeLabel.ownerLayout.applyConstraints {
            $0.height(40)
            $0.width(100)
        }
        
    }
    
    private func configureStyle() {
        backgroundColor = .white
        isUserInteractionEnabled = true
    }
    
    private func configureButton() {
        components.aproachButton.addTarget(
            self, action: #selector(aproachButtonActionHandleTapped), for: .touchUpInside
        )
    }
    
    @objc private func aproachButtonActionHandleTapped() {
        delegate?.aprachButtonWasTapped()
    }
    
}

extension AproachView: AproachViewComponentsDelegate {
    
    func closeButtonHandle() {
        delegate?.closeButtonWasTapped()
    }
    
}
