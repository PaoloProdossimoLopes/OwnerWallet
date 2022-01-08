//
//  OwnerWalletViewController.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 20/12/21.
//

import UIKit
import OwnerLIB

protocol MyWalletViewControllerNavigateDelegate: AnyObject {
    func navigateToAssetDetail(_ asset: AssetModel)
}

final class MyWalletViewController: UIViewController {
    
    //MARK: - Properties
    
    private let viewModel: WalltetViewModelProtocol
    weak var navigateDelegate: MyWalletCoordinatorNavigate?
    
    //MARK: - UI Components
    
    private lazy var userImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .ownerBlue
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: MWVCConst.Layout.imageSize).isActive = true
        iv.widthAnchor.constraint(equalToConstant: MWVCConst.Layout.imageSize).isActive = true
        iv.layer.cornerRadius = MWVCConst.Layout.imageSize/2
        return iv
    }()
    
    private lazy var includeAssetButton: UIButton = {
        
        let BSize = MWVCConst.Layout.includeAssetButtonSize
        let BName = MWVCConst.LocalizedString.includeAssetButtonName
        let BFontSize = MWVCConst.Layout.incluseAssetButtonFontSize
        
        let button = UIButton(type: .system)
        button.setTitle(BName, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: BFontSize)
        button.backgroundColor = .ownerBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: (2 * BSize) ).isActive = true
        button.heightAnchor.constraint(equalToConstant: BSize).isActive = true
        button.layer.cornerRadius = BSize/2
        
        return button
    }()
    
    private lazy var yourBalanceComponent: OwnerYourBalanceInformation = {
        let view = OwnerYourBalanceInformation(
            title: MWVCConst.LocalizedString.yourBalanceComponentTitle,
            value: "R$ 30.000,00"
        )
        return view
    }()
    
    private lazy var assetsTableView: AssetTableView = {
       let table = AssetTableView(self, listOf: viewModel.assets)
        table.navigateDelegate = self
        return table
    }()
    
    //MARK: - Constructor
    
    init(viewModel: WalltetViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func commonInit() {
        configureViewHierarcy()
        configureConstraints()
        configureStyle()
    }
    
    //MARK: - Helpers
    
    func configureViewHierarcy() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: userImageView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: includeAssetButton)
        
        [yourBalanceComponent, assetsTableView]
            .forEach { [weak self] customView in self?.view.addSubview(customView) }
    
    }
    
    func configureConstraints() {
        
        yourBalanceComponent.ownerLayout.applyConstraints {
            $0.top(at: self.view.safeAreaLayoutGuide.topAnchor)
            $0.leading(at: self.view.leadingAnchor)
            $0.trailing(at: self.view.trailingAnchor)
        }
        
        assetsTableView.ownerLayout.applyConstraints {
            $0.top(at: self.yourBalanceComponent.bottomAnchor)
            $0.leading(at: self.view.leadingAnchor)
            $0.trailing(at: self.view.trailingAnchor)
            $0.greaterOrEqual(fixAt:self.view.safeAreaLayoutGuide.bottomAnchor, distance: -10)
        }
        
    }
    
    func configureStyle() {
        view.backgroundColor = .white
        
        navigationItem.title = "Minha carteira"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    //MARK: - Selectors
    
}

//MARK: - MyWalletViewControllerNavigateDelegate

extension MyWalletViewController: MyWalletViewControllerNavigateDelegate {
    func navigateToAssetDetail(_ asset: AssetModel) {
        self.navigateDelegate?.navigateToAssetDetail(asset)
    }
}


//MARK: - MWVCConst

extension MyWalletViewController {
    private struct MWVCConst {
        private init() {}
        
        struct Layout {
            private init() {}
            static let titleLabelHeight: CGFloat = 18
            static let imageSize: CGFloat = 35
            static let includeAssetButtonSize: CGFloat = 40
            static let incluseAssetButtonFontSize: CGFloat = 14
        }
        
        struct LocalizedString {
            private init() {}
            static let includeAssetButtonName: String = "+ ativo"
            static let yourBalanceComponentTitle: String =  "Patrímonio total"
        }
        
    }
}
