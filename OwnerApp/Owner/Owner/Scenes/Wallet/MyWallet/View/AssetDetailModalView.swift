//
//  AssetDetailModal.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 26/12/21.
//

import UIKit
import OwnerLIB

final class AssetDetailModalView: UIView {
    
    //MARK: - Properties
    
    private let model: AssetModel
    private let fromView: UIViewController
    
    private let sizeScreen = UIScreen.main.bounds
    
    //MARK: - UI Components
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Cponstructor
    
    init(from: UIViewController, asset model: AssetModel) {
        self.fromView = from
        self.model = model
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - helpers
    
    private func commonInit() {
        configureViewHierarchy()
        configureStyle()
        configureConstraints()
    }
    
    func configureViewHierarchy() {
        fromView.view.addSubview(self)
        self.addSubview(containerView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: fromView.view.safeAreaLayoutGuide.topAnchor),
            self.leadingAnchor.constraint(equalTo: fromView.view.safeAreaLayoutGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: fromView.view.safeAreaLayoutGuide.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: fromView.view.safeAreaLayoutGuide.bottomAnchor),
            
            self.containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.containerView.heightAnchor.constraint(equalToConstant: (sizeScreen.height * 0.8)),
            self.containerView.widthAnchor.constraint(equalToConstant: (sizeScreen.width * 0.8)),
        ])
    }
    
    func configureStyle() {
        configureTaOutsideView()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureTaOutsideView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dimissalContainerView))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
    
    func show() {
        configureInAndOutAnimation()
    }
    
    private func configureInAndOutAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.containerView.frame.origin.y = -(UIScreen.main.bounds.height/2)
        }
    }
    
    private func dismissedView() {
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn) {
            self.containerView.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.alpha = 0
            
        } completion: { (complete) in
            if complete { self.containerView.removeFromSuperview()
            }
        }
    }
    
    //MARK: - Selectors
    
    @objc func dimissalContainerView() {
        dismissedView()
    }
    
}
