//
//  OwnerPrimaryButton.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 05/01/22.
//

import UIKit

typealias OPBProtocol = UIButton & OwnerPrimaryButtonProtocol

protocol OwnerPrimaryButtonProtocol: UIView {
    var delegate: OwnerPrimaryButtonDelegate? { get set }
    init(_ type: OwnerPrimaryButtonType, title: String, font: UIFont, bg: UIColor, haveShadow: Bool)
}

protocol OwnerPrimaryButtonDelegate: AnyObject {
    func buttonWasTapped(_ button: OwnerPrimaryButton)
}

enum OwnerPrimaryButtonType {
    case square
    case rounded
}

final class OwnerPrimaryButton: OPBProtocol {
    
    private let type: OwnerPrimaryButtonType
    private let title: String
    private let font: UIFont
    private let bgColor: UIColor
    private let haveShadow: Bool
    
    weak var delegate: OwnerPrimaryButtonDelegate?
    
    init(_ type: OwnerPrimaryButtonType, title: String, font: UIFont = .boldSystemFont(ofSize: 16),
         bg: UIColor = .white, haveShadow: Bool = false) {
        self.type = type
        self.title = title
        self.font = font
        self.bgColor = bg
        self.haveShadow = haveShadow
        super.init(frame: .zero)
        configureButton()
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        addTarget(self, action: #selector(buttonHandleTapped), for: .touchUpInside)
    }
    
    private func commonInit() {
        configureConstraints()
        configureStyle()
    }
    
    private func configureConstraints() {
        let wid = UIScreen.main.bounds.width
        ownerLayout.applyConstraints {
            $0.height(type == .rounded ? 40 : 50)
            $0.width(wid * 0.7)
        }
    }
    
    private func configureStyle() {
        setTitle(title, for: .normal)
        titleLabel?.font = font
        setTitleColor(bgColor, for: .normal)
        backgroundColor = .ownerBlue
        configureButtonWithType()
        configureShadow()
        
    }
    
    private func configureButtonWithType() {
        if type == .rounded {
            layer.cornerRadius = 40/2
        } else if type == .square {
            layer.cornerRadius = 10
        }
    }
    
    private func configureShadow() {
        if haveShadow {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 3
            layer.shadowOpacity = 0.2
        }
    }
    
    @objc private func buttonHandleTapped() {
        delegate?.buttonWasTapped(self)
    }
    
}
