//
//  WalletDetailTableViewCell.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 04/01/22.
//

import UIKit
import OwnerLIB

final class WalletDetailTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    static let registerName: String = String(describing: self)
    private var aproach: WalletAssetAproachDetailModel? { didSet { inputDatas() }}
    
    //MARK: - UIComponents
    
    private lazy var dateOfAproachLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var quantityOfAssetsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var valueOfAproachLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            dateOfAproachLabel, quantityOfAssetsLabel, valueOfAproachLabel
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var divider = self.dividerView()
    
    //MARK: - Constructor
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func commonInit() {
        configureViewHierarchy()
        configureConstraints()
        configureStyle()
        inputDatas()
    }
    
    private func configureViewHierarchy() {
        addSubview(mainStackView)
    }
    
    private func configureConstraints() {
        mainStackView.ownerLayout.applyConstraints {
            $0.top(at: self.topAnchor, distance: 10)
            $0.leading(at: self.leadingAnchor)
            $0.trailing(at: self.trailingAnchor)
        }
        
        divider.ownerLayout.applyConstraints {
            $0.top(at: self.mainStackView.bottomAnchor, distance: 10)
            $0.bottom(at: self.bottomAnchor, distance: -5)
        }
    }
    
    private func inputDatas() {
        self.dateOfAproachLabel.text = aproach?.dateFormatted
        self.quantityOfAssetsLabel.text = aproach?.quantityOfAssetsFormatted
        self.valueOfAproachLabel.text = aproach?.valueOfAproachFormatted
    }
    
    private func configureStyle() {
        backgroundColor = .white
    }
    
    //MARK: - Setters
    
    func setAproach(_ aproach: WalletAssetAproachDetailModel) {
        self.aproach = aproach
    }
    
}
