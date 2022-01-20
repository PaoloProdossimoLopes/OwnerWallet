//
//  AproachViewController.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 12/01/22.
//

import UIKit

protocol AproachViewControllerNavigate: AnyObject {
    func aprachButtonWasTapped()
    func closeButtonWasTapped()
}

final class AproachViewController: UIViewController {
    
    private var customView: AproachView?
    private let viewModel: AproachViewModel
    
    var navigate: AproachViewControllerNavigate?
    
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
        customView?.delegate = self
    }
    
}

extension AproachViewController: AproachViewDelegate {
    func aprachButtonWasTapped() {
        navigate?.aprachButtonWasTapped()
    }
    
    func closeButtonWasTapped() {
        navigate?.closeButtonWasTapped()
    }
}
