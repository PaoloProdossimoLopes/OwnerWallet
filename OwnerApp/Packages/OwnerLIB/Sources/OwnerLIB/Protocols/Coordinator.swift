//
//  File.swift
import UIKit

public protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}

open class Coordinator: CoordinatorProtocol {

    open var navigationController: UINavigationController
    open var childCoordinators: [Coordinator] = [Coordinator]()

    public init(with navigation: UINavigationController) {
        self.navigationController = navigation
    }

    open func start() {}

}
