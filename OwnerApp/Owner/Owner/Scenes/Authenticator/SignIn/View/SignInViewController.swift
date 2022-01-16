//
//  SignInViewController.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 16/01/22.
//

import UIKit

protocol SignInViewControllerNavigate: AnyObject {
    func navigateToHome()
}

final class SignInViewController: UIViewController {
    
    var navigate: SignInViewControllerNavigate?
    private var UIComponents: SignInUIComponents = .init()
    private let viewModel: SignInViewModel
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
        configureDelegate()
        configureTap()
    }
    
    private func configureHierarchy() {
        view.addSubview(UIComponents.loginStackView)
        view.addSubview(UIComponents.registerStackView)
    }
    
    private func configureConstraints() {
        UIComponents.loginStackView.ownerLayout.applyConstraints {
            $0.centerX(at: self.view.centerXAnchor)
            $0.centerY(at: self.view.centerYAnchor)
            $0.leading(at: self.view.leadingAnchor, distance: 30)
            $0.trailing(at: self.view.trailingAnchor, distance: -30)
        }
        
        UIComponents.registerStackView.ownerLayout.applyConstraints {
            $0.bottom(at: self.view.safeAreaLayoutGuide.bottomAnchor, distance: -10)
            $0.centerX(at: self.view.centerXAnchor)
        }
    }
    
    private func configureDelegate() {
        UIComponents.signInButton.delegate = self
    }
    
    private func configureStyle() {
        view.backgroundColor = .white
    }
    
    private func configureTap() {
        let tap = UITapGestureRecognizer(
            target: self, action: #selector(registerLabelHandleTapped)
        )
        UIComponents.registerSecondPartUndelinedLabel.addGestureRecognizer(tap)
            
    }
    
    @objc private func registerLabelHandleTapped() {
        print("Tap")
    }
    
}

extension SignInViewController: OwnerPrimaryButtonDelegate {
    func buttonWasTapped(_ button: OwnerPrimaryButton) {
        navigate?.navigateToHome()
    }
}
