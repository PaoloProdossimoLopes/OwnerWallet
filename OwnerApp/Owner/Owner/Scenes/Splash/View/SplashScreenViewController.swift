//
//  SplashScreenViewController.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 19/01/22.
//

import UIKit

protocol SplashScreenViewControllerNavigate: AnyObject {
    func advanceScreen(_ viewController: SplashScreenViewController)
}

final class SplashScreenViewController: UIViewController {
    
    var navigate: SplashScreenViewControllerNavigate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ownerBlue
        advance()
    }
    
    private func advance() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.navigate?.advanceScreen(self)
        }
    }
    
}
