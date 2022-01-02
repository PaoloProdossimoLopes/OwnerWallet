//
//  OwnerTabViewController.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 20/12/21.
//

import UIKit

final class OwnerTabViewController: UITabBarController {
    
    private let listviewControllers: [UIViewController]
    
    init(tabs viewControllers: [UIViewController]) {
        self.listviewControllers = viewControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBars()
    }
    
    private func configureBars() {
        viewControllers = listviewControllers
        
        tabBar.barTintColor = UIColor.white
        tabBar.isTranslucent = true
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .lightGray.withAlphaComponent(0.4)
        tabBar.tintColor = .ownerBlue
    }
    
}
