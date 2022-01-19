//
//  ModuleRouter.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 18/01/22.
//

import UIKit

open class ModuleRouter: Router {
    
    public var currentController: UIViewController
    public var isToPresentModal: Bool = false
    private let window: UIWindow?
    
    public init(_ isToPresentModal: Bool = false, window: UIWindow) {
        self.isToPresentModal = isToPresentModal
        self.currentController = .init()
        self.window = window
    }
    
    public func dismiss(animated: Bool) { /*Don't do anything*/ }
    
    public func present(
        _ viewController: UIViewController,
        animated: Bool,
        onDismissed: (() -> Void)?
    ) {
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
}
