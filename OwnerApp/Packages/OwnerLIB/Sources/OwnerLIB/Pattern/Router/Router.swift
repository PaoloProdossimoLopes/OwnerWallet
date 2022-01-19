//
//  Router.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 18/01/22.
//

import UIKit

public protocol Router: AnyObject {
    var currentController: UIViewController { get }
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (()->Void)?)
    func dismiss(animated: Bool)
}

//MARK: - Default implementation
extension Router {
    public func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: animated, onDismissed: nil)
    }
}
