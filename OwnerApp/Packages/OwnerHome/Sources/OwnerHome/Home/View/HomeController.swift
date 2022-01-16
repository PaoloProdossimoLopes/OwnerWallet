//
//  HomeViewController.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 20/12/21.
//

import UIKit
import OwnerLIB

public class HomeViewController: UITableViewController {
    
    //MARK: - Properties
    private let viewModel: HomeViewModel
    private let UIComponents: HomeUIComponents = .init()
    
    //MARK: - Constructor
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()        
    }
    
    //MARK: - Helpers
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
        viewModel.fetchAssets()
    }
    
    private func configureBindings() {
        viewModel.updateView = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func configureHierarchy() {
        navigationController?.navigationBar.topItem?.searchController = UIComponents.searchBar
        tableView.backgroundView = UIComponents.activityIndicator
    }
    
    private func configureConstraints() {
        
    }
    
    private func configureStyle() {
        navigationItem.title = "HOME"
        
        view.backgroundColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        tableView.register(HomeTableViewCell.self,
                           forCellReuseIdentifier: HomeTableViewCell.registerName)
        UIComponents.searchBar.searchBar.searchTextField.delegate = self
        navigationController?.navigationBar.shadowImage = UIImage()
        tableView.separatorStyle = .none
    }
    
}

//MARK: DataSource
extension HomeViewController {
    
    public override func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeTableViewCell.registerName, for: indexPath
        ) as? HomeTableViewCell else { return UITableViewCell() }
        
        let model = viewModel.assetsFieltered[indexPath.row]
        cell.setupInformations(model)
        cell.selectionStyle = .none
        
        return cell
    }
    
    public override func tableView(
        _ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.assetsFieltered.count
    }
    
    
}


//MARK: - Delegate
extension HomeViewController: UITextFieldDelegate {
    
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            guard let text = textField.text else { return }
            self.viewModel.updateList(text: text)
        }
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        viewModel.resetList()
        return true
    }
    
}
