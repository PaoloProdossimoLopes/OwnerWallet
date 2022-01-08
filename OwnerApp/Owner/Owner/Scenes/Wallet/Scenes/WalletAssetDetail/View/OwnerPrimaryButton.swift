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
    init(title: String, font: UIFont, bg: UIColor)
}

protocol OwnerPrimaryButtonDelegate: AnyObject {
    func buttonWasTapped(_ button: OwnerPrimaryButton)
}

final class OwnerPrimaryButton: OPBProtocol {
    
    private let title: String
    private let font: UIFont
    private let bgColor: UIColor
    
    weak var delegate: OwnerPrimaryButtonDelegate?
    
    init(title: String, font: UIFont = .boldSystemFont(ofSize: 16),
         bg: UIColor = .white) {
        self.title = title
        self.font = font
        self.bgColor = bg
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        let wid = UIScreen.main.bounds.width
        
        setTitle("ADD INVESTIMENTO", for: .normal)
        titleLabel?.font = font
        setTitleColor(bgColor, for: .normal)
        backgroundColor = .ownerBlue
        layer.cornerRadius = 40/2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.2
        
        ownerLayout.applyConstraints {
            $0.height(40)
            $0.width(wid * 0.7)
        }
        
        addTarget(self, action: #selector(buttonHandleTapped), for: .touchUpInside)
    }
    
    @objc private func buttonHandleTapped() {
        delegate?.buttonWasTapped(self)
    }
    
}
