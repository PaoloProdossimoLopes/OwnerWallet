//
//  File.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 20/12/21.
//

import UIKit
import OwnerLIB

public class HomeController: UIViewController {
    
    private let viewModel: HomeViewModel
    private let customView: HomeView = .init()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        super.loadView()
        view = customView
    }
    
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
