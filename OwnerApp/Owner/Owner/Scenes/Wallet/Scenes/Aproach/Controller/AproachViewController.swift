//
//  AproachViewController.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 12/01/22.
//

import UIKit

final class AproachViewController: UIViewController {
    
    private var customView: AproachView?
    
    override func loadView() {
        super.loadView()
        customView = .init()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
