//
//  WalletDetailCoordinator.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 01/01/22.
//

import OwnerLIB
import UIKit

protocol WalletDetailCoordinatorNavigate: AnyObject {
    func navigateToBack()
}

final class WalletDetailCoordinator: Coordinator {
    
    //MARK: - Properties
    
    private let asset: AssetModel
    private var listOfAproached: [WalletAssetAproachDetailModel] = []
    
    private var aproachCoordinator: AproachCoordinator?
    private let service: WalletAssetDetailAPI = .shared
    
    weak var navigate: WalletDetailCoordinatorNavigate?
    
    //MARK: - Constructor
    
    init(_ nav: UINavigationController, asset: AssetModel) {
        self.asset = asset
        super.init(with: nav)
        aproachCoordinator = .init(nav)
    }
    
    //MARK: - Starter
    
    override func start() {
        callAPIs()
    }
    
    private func callAPIs() {
        service.fetchListOfAproacheds { [weak self] reponseList in
            reponseList.forEach { response in
                let model = WalletAssetAproachDetailModel(response: response)
                self?.listOfAproached.append(model)
            }
            
            showWalletDetailView()
        }
    }
    
    private func showWalletDetailView() {
        let viewModel = WallatDetailViewModel(
            asset: self.asset,
            listOfAssetsAproacheds: listOfAproached
        )
        let controller = WalletDetailViewController(viewModel: viewModel)
        controller.navigate = self
        navigationController.show(controller, navigate: .push)
    }
    
}

extension WalletDetailCoordinator: WalletDetailViewControllerNavigate {
    func navigateToAproach() {
        aproachCoordinator?.start()
    }
    
    func navigateToBack() {
        navigate?.navigateToBack()
    }
}
