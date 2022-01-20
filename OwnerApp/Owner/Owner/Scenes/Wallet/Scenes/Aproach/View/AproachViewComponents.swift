//
//  AproachViewComponents.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 12/01/22.
//

import UIKit
import OwnerLIB

protocol AproachViewComponentsDelegate: AnyObject {
    func closeButtonHandle()
}

class AproachViewComponents {
    
    var delegate: AproachViewComponentsDelegate?
    
    lazy var closeButton: UIButton = {
        let image = UIImage(systemName: "xmark")?
            .withTintColor(.ownerBlue, renderingMode: .alwaysOriginal)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(closeButtonHandle),
                         for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "APORTAR"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    //Header information
    
    let assetCodeLabel: AssetCodeLabel = {
        let label = AssetCodeLabel()
        label.text = "ITUB3"
        label.layer.cornerRadius = 40/2
        return label
    }()
    
    let assetNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Itau unibanco"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    let assetSegmentLabel: UILabel = {
        let label = UILabel()
        label.text = "Banco"
        return label
    }()
    
    lazy var assetHStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [assetCodeLabel, assetVStackView, UIView()])
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    lazy var assetVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [assetNameLabel, assetSegmentLabel])
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    //Input infos
    let assetPriceTF: OwnerCustomTextFieldArea = {
        let tf = OwnerCustomTextFieldArea(
            image: "staroflife.fill", title: "Price", placeholder: "EX: R$ 32,00"
        )
        return tf
    }()
    
    let assetDateTF: OwnerCustomTextFieldArea = {
        let tf = OwnerCustomTextFieldArea(
            image: "calendar", title: "Date", placeholder: "EX: 10/01/2000"
        )
        return tf
    }()
    
    let assetQuantityTF: OwnerCustomTextFieldArea = {
        let tf = OwnerCustomTextFieldArea(
            image: "square.3.stack.3d.top.filled", title: "Quantity",
            placeholder: "EX: 10/01/2000"
        )
        return tf
    }()
    
    let mainTextViewStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        return stack
    }()
    
    let aproachButton: UIButton = {
        let button = UIButton()
        button.setTitle("APORTAR", for: .normal)
        button.backgroundColor = .ownerBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    //MARK: - Selectors
    
    @objc private func closeButtonHandle() {
        delegate?.closeButtonHandle()
    }
    
}
