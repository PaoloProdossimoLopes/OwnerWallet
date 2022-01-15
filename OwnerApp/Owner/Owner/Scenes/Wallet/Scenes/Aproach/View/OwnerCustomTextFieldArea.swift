//
//  OwnerCustomTextFieldArea.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 14/01/22.
//

import UIKit

final class OwnerCustomTextFieldArea: UIStackView {
    
    //MARK: - Properties
    
    let title: String
    let imageName: String
    let placeholder: String
    
    //MARK: - Components
    
    private lazy var imagePlaceholder: UIImageView = {
        let image = UIImage(systemName: imageName)?
            .withTintColor(.ownerBlue.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var textFieldTitleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var mainTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = placeholder
        return tf
    }()
    
    private let leftPaddingView = UIView()
    
    private lazy var TFHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftPaddingView, imagePlaceholder,
                                                   mainTextField])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.layer.cornerRadius = 10
        stack.layer.borderColor = UIColor.ownerBlue.withAlphaComponent(0.4).cgColor
        stack.layer.borderWidth = 1
        return stack
    }()
    
    //MARK: - Constructor
    
    init(image: String, title: String, placeholder: String) {
        self.imageName = image
        self.title = title
        self.placeholder = placeholder
        super.init(frame: .zero)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func commonInit() {
        configureViewHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureViewHierarchy() {
        [textFieldTitleLabel, TFHStack]
            .forEach { self.addArrangedSubview($0) }
    }
    
    private func configureConstraints() {
        leftPaddingView.ownerLayout.applyConstraints {
            $0.width(1)
        }
        
        mainTextField.ownerLayout.applyConstraints {
            $0.height(50)
        }
        
        imagePlaceholder.ownerLayout.applyConstraints {
            $0.width(20)
        }
    }
    
    private func configureStyle() {
        axis = .vertical
        spacing = 10
    }
    
}
