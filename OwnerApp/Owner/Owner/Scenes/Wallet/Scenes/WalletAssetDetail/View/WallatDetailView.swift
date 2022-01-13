//
//  WallatDetailView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 02/01/22.
//

import UIKit
import OwnerLIB

protocol WallatDetailViewDelegate: AnyObject {
    func removeAsset(_ asset: AssetModel)
    func navigateToAproach()
    func navigateToBack()
}

final class WallatDetailView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: WallatDetailViewDelegate?
    private let viewModel: WallatDetailViewModelProtocol
    
    //MARK: - UI Components
    
//    private lazy var topViewDetailModalIndicator: UIView = {
//        let view = UIView()
//        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = WDVConst.Layout.topIndicatorHeight/2
//        return view
//    }()
    
    private lazy var backButton: UIButton = {
        let image = UIImage(systemName: "arrow.left")?.withTintColor(.ownerBlue, renderingMode: .alwaysOriginal)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.setButtonImageSize(24)
        button.addTarget(self, action: #selector(backButtonHandleTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var removeAssetButton: UIButton = {
        return .configureAditionalButtons(
            target: self, imageSystemName: "trash",
            color: .systemRed.withAlphaComponent(0.4),
            action: #selector(trashButtonHandleTapped), imageSize: 26
        )
    }()
    
    
    private lazy var assetCodeLabel: AssetCodeLabel = {
        let label = AssetCodeLabel()
        label.text = viewModel.asset.assetCode
        label.layer.cornerRadius = 40/2
        label.updateFont(font: .systemFont(ofSize: 20, weight: .black))
        return label
    }()
    
    //Name and segment
    private lazy var assetNameAndSegmentStackView: TitleAndSubtitleVStackView = .init(
        title: viewModel.asset.assetName, subtitle: viewModel.asset.assetSegment
    )
    
    //Amount
    private lazy var assetAmmountHorizontalStackView = AssetAmountInformationHorizontalStackView(
        title: "Patrimônio", subtitle: viewModel.asset.assetAmountValueFormatted
    )
    
    //Quantity And CurentPrice
    private lazy var assetHorizontalStackView: AssetHorizontalWithVerticalStackView = {
        let list: [AssetVStackViewModel] = [
            .init(title: "Quantidade", subtitle: viewModel.asset.assetQuantityFormatted),
            .init(title: "Cotação", subtitle: viewModel.asset.assetPriceFormatted)
        ]
        let stack = AssetHorizontalWithVerticalStackView(listOfAssetVStackViewModel: list)
        return stack
    }()
    
    private lazy var aproachTableViewTitle: UILabel = {
        let label = UILabel()
        label.text = "Registro de aportes"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private lazy var aproachTableViewSubtitleSheetStackView: UIStackView = {
        let date = UILabel()
        date.text = "Data"
        date.font = .boldSystemFont(ofSize: 12)
        date.textColor = .black
        date.textAlignment = .left
        
        let quantity = UILabel()
        quantity.text = "QTD"
        quantity.font = .boldSystemFont(ofSize: 12)
        quantity.textColor = .black
        quantity.textAlignment = .center
        
        let value = UILabel()
        value.text = "Valor"
        value.font = .boldSystemFont(ofSize: 12)
        value.textColor = .black
        value.textAlignment = .right
        
        let stack = UIStackView(arrangedSubviews: [date, quantity, value])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var aproachTableView: WalletDetailTableView = {
        let viewModel = WalletDetailTableViewModel(
            assetModel: viewModel.asset,
            listOfAproach: viewModel.listOfAssetsAproacheds
        )
        let table = WalletDetailTableView(viewModel: viewModel)
        return table
    }()
    
    private lazy var addNewAssetAproachButton: OwnerPrimaryButtonProtocol = {
        let button: OwnerPrimaryButtonProtocol = OwnerPrimaryButton(title: "APORTAR")
        button.delegate = self
        return button
    }()
    
    //MARK: - Constructor
    
    init(viewModel: WallatDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func commonInit() {
        configureViewHierarchy()
        configureConstarints()
        configureStyle()
    }
    
    private func configureViewHierarchy() {
        addSubview(removeAssetButton)
        addSubview(addNewAssetAproachButton)
//        addSubview(topViewDetailModalIndicator)
        addSubview(backButton)
        addSubview(assetCodeLabel)
        addSubview(assetNameAndSegmentStackView)
        addSubview(assetAmmountHorizontalStackView)
        addSubview(assetHorizontalStackView)
        addSubview(aproachTableViewTitle)
        addSubview(aproachTableViewSubtitleSheetStackView)
        addSubview(aproachTableView)

    }
    
    private func configureConstarints() {
        
//        topViewDetailModalIndicator.ownerLayout.applyConstraints {
//            $0.centerX(at: self.centerXAnchor)
//            $0.top(at: self.safeAreaLayoutGuide.topAnchor, distance: 10)
//            $0.height(WDVConst.Layout.topIndicatorHeight)
//            $0.width(WDVConst.Layout.topIndicatorWidth)
//        }
        
        assetCodeLabel.ownerLayout.applyConstraints {
            //$0.top(at: topViewDetailModalIndicator.bottomAnchor, distance: 20)
            $0.top(at: self.safeAreaLayoutGuide.topAnchor, distance: 10)
            $0.centerX(at: self.centerXAnchor)
            $0.height(40)
            $0.width(3*40)
        }
        
        removeAssetButton.ownerLayout.applyConstraints {
            $0.centerY(at: self.assetCodeLabel.centerYAnchor)
            $0.trailing(at: self.trailingAnchor, distance: -20)
            $0.height(36)
            $0.width(36)
        }
        
        backButton.ownerLayout.applyConstraints {
            $0.centerY(at: self.assetCodeLabel.centerYAnchor)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.height(36)
            $0.width(36)
        }
        
        assetNameAndSegmentStackView.ownerLayout.applyConstraints {
            $0.top(at: self.assetCodeLabel.bottomAnchor, distance: 30)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
        }
        
        assetAmmountHorizontalStackView.ownerLayout.applyConstraints {
            $0.top(at: self.assetNameAndSegmentStackView.bottomAnchor, distance: 30)
            $0.leading(at: self.leadingAnchor, distance: 30)
            $0.trailing(at: self.trailingAnchor, distance: -30)
        }
        
        assetHorizontalStackView.ownerLayout.applyConstraints {
            $0.top(at: self.assetAmmountHorizontalStackView.bottomAnchor, distance: 10)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
        }
        
        aproachTableViewTitle.ownerLayout.applyConstraints {
            $0.top(at: self.assetHorizontalStackView.bottomAnchor, distance: 30)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
        }
        
        aproachTableViewSubtitleSheetStackView.ownerLayout.applyConstraints {
            $0.top(at: self.aproachTableViewTitle.bottomAnchor, distance: 10)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
        }
        
        aproachTableView.ownerLayout.applyConstraints {
            $0.top(at: self.aproachTableViewSubtitleSheetStackView.bottomAnchor, distance: 5)
            $0.leading(at: self.aproachTableViewSubtitleSheetStackView.leadingAnchor)
            $0.trailing(at: self.aproachTableViewSubtitleSheetStackView.trailingAnchor)
            $0.bottom(at: self.addNewAssetAproachButton.topAnchor, distance: -10)
        }
        
        addNewAssetAproachButton.ownerLayout.applyConstraints {
            $0.centerX(at: self.centerXAnchor)
            $0.bottom(at: self.safeAreaLayoutGuide.bottomAnchor, distance: -20)
            $0.height(40)
        }
        
    }
    
    private func configureStyle() {
        self.backgroundColor = .white
    }
    
    //MARK: - Selectors
    
    @objc private func trashButtonHandleTapped() {
        delegate?.removeAsset(viewModel.asset)
    }
    
    @objc private func backButtonHandleTapped() {
        delegate?.navigateToBack()
    }
    
}

extension WallatDetailView: OwnerPrimaryButtonDelegate {
    func buttonWasTapped(_ button: OwnerPrimaryButton) {
        delegate?.navigateToAproach()
    }
}

//MARK: - WDVConst

extension WallatDetailView {
private struct WDVConst {
    private init() {}
    
    struct Layout {
        private init() {}
        static let topIndicatorHeight: CGFloat = 10
        static let topIndicatorWidth: CGFloat = 50
    }
        
}}
