//
//  File.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 20/12/21.
//

import UIKit
import OwnerLIB

public class HomeController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        
    }
    
    private func commonInit() {
        configureStyle()
    }
    
    func configureStyle() {
        navigationItem.title = "HOME"
        
        view.backgroundColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    
}
