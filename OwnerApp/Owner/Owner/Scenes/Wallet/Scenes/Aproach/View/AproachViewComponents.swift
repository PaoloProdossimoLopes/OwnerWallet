//
//  AproachViewComponents.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 12/01/22.
//

import UIKit
import OwnerLIB

struct AproachViewComponents {
    
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
    
//    let imagePlaceholder: UIImageView = {
//        let image = UIImage(systemName: "xmark")?
//            .withTintColor(.lightGray, renderingMode: .alwaysOriginal)
//        let iv = UIImageView(image: image)
//        iv.contentMode = .scaleAspectFit
//        return iv
//    }()
//    
//    let textFieldTitleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Title"
//        label.font = .boldSystemFont(ofSize: 20)
//        return label
//    }()
//    
//    let mainTextField: UITextField = {
//        let tf = UITextField()
//        tf.placeholder = "placeholder ..."
//        return tf
//    }()
//    
//    lazy var TFHStack: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [UIView(), imagePlaceholder,
//                                                   mainTextField, UIView()])
//        stack.axis = .horizontal
//        stack.spacing = 20
//        stack.layer.cornerRadius = 10
//        stack.layer.borderColor = UIColor.black.cgColor
//        stack.layer.borderWidth = 1
//        return stack
//    }()
    
//    lazy var TFVStack: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [textFieldTitleLabel, TFHStack])
//        stack.axis = .vertical
//        stack.spacing = 10
//        return stack
//    }()
    
    let assetPriceTF: OwnerCustomTextFieldArea = {
        let tf = OwnerCustomTextFieldArea(
            image: "staroflife.fill", title: "Price", placeholder: "EX: R$ 32,00"
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
        button.setTitle("+", for: .normal)
        button.backgroundColor = .ownerBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
}
