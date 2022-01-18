//
//  Coordinator.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 18/01/22.
//

import Foundation

public protocol Coordinator: AnyObject {
    
    var children: [Coordinator] { get set }
    var router: Router { get }
    
    func start()
    
    func present(animated: Bool, onDismissed: (() -> Void)?)
    func dismiss(animated: Bool)
    func presentChild(
        _ child: Coordinator, animated: Bool, onDismissed: (() -> Void)?
    )
    
}

//MARK: - Default implementation

extension Coordinator {
    
    func start() { }
    
    public func dismiss(animated: Bool) {
        router.dismiss(animated: animated)
    }
    
    private func removeChild(_ child: Coordinator) {
        print("REMOVE: \(child)")
        guard let index = children.firstIndex(where: { $0 === child })
        else { return }
        children.remove(at: index)
    }
    
    public func presentChild(
        _ child: Coordinator, animated: Bool, onDismissed: (() -> Void)? = nil
    ) {
        children.append(child)
        child.present(animated: animated, onDismissed: { [weak self, weak child] in
            guard let self = self , let child = child else { return }
            self.removeChild(child)
            onDismissed?()
        })
    }
    
}
