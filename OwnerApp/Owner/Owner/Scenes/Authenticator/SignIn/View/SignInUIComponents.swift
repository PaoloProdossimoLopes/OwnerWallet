//
//  SignInUIComponents.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 16/01/22.
//

import OwnerLIB
import UIKit

struct SignInUIComponents {
    
    let CPFTextField: OwnerCustomTextFieldArea = {
        let tf = OwnerCustomTextFieldArea(
            image: "person", title: "CPF:", placeholder: "Digite seu CPF ..."
        )
        return tf
    }()
    
    let passwordTextField: OwnerCustomTextFieldArea = {
        let tf = OwnerCustomTextFieldArea(
            image: "lock", title: "Senha:", placeholder: "Digite sua senha ..."
        )
        return tf
    }()
    
    let signInButton: OwnerPrimaryButton = {
        let button = OwnerPrimaryButton(.square, title: "ENTRAR")
        return button
    }()
    
    let registerFistPartLabel: UILabel = {
        let label = UILabel()
        label.text = "Ainda não possui conta?"
        label.textAlignment = .right
        return label
    }()
    
    let registerSecondPartUndelinedLabel: UILabel = {
        let label = UILabel()
        label.text = "Registre-se"
        label.textColor = .ownerBlue
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        label.attributedText = NSAttributedString(
            string: label.text ?? "",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var loginStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [CPFTextField, passwordTextField, signInButton])
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    lazy var registerStackView: UIStackView = {
        let stack = UIStackView(
            arrangedSubviews:
                [UIView(), registerFistPartLabel, registerSecondPartUndelinedLabel, UIView()]
        )
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
}
