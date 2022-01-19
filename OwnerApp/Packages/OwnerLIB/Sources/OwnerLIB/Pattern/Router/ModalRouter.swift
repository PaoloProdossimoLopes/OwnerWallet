//
//  ModalRouter.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 18/01/22.
//

import UIKit

public class ModalRouter: NSObject {
    
    public let currentController: UIViewController
    private let navigationController = UINavigationController()
    private var onDismissForViewController: [UIViewController: (() -> Void)] = [:]
    private var showCancelButton: Bool
    
    public init(
        _ modalType: UIModalPresentationStyle = .pageSheet,
        parentViewController: UIViewController,
        showCancelButton: Bool = true
    ) {
        self.currentController = parentViewController
        self.showCancelButton = showCancelButton
        super.init()
        navigationController.delegate = self
        navigationController.modalPresentationStyle = modalType
    }
    
}

extension ModalRouter: Router {
    
    public func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
    
        onDismissForViewController[viewController] = onDismissed
        
        if navigationController.viewControllers.count == 0 {
            presentModally(viewController, animated: animated)
        } else {
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    public func dismiss(animated: Bool) {
        guard let first = navigationController.viewControllers.first else { return }
        performOnDismissed(for: first)
        currentController.dismiss(animated: animated, completion: nil)
    }
    
    //MARK: - Private methods
    private func presentModally(_ viewController: UIViewController, animated: Bool) {
        if showCancelButton { addCancelButton(to: viewController) }
        navigationController.setViewControllers([viewController], animated: false)
        currentController.present(navigationController, animated: animated, completion: nil)
    }
    
    private func addCancelButton(to viewController: UIViewController) {
        let button = UIBarButtonItem(
            title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed)
        )
        viewController.navigationItem.leftBarButtonItem = button
    }
    
    @objc private func cancelPressed() {
        performOnDismissed(for: navigationController.viewControllers.first!)
        dismiss(animated: true)
    }
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else { return }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
    
}

extension ModalRouter: UINavigationControllerDelegate {
    public func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController, animated: Bool
    ) {
        guard let dismissedViewController = navigationController
                .transitionCoordinator?
                .viewController(forKey: .from),
              !navigationController.viewControllers
                .contains(dismissedViewController)
        else { return }
        performOnDismissed(for: dismissedViewController)
    }
    
}
