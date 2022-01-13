//
//  AproachViewController.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 12/01/22.
//

import UIKit

final class AproachViewController: UIViewController {
    
    private var customView: AproachView?
    private let viewModel: AproachViewModel
    
    init(viewModel: AproachViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        customView = .init(self)
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
