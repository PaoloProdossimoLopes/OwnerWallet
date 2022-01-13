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
    
    let aproachButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .ownerBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
}
