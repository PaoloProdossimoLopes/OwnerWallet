//
//  AssetTableViewCell.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 26/12/21.
//

import UIKit
import OwnerLIB

final class AssetTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let registerName: String = String(describing: self)
    
    private(set) var assetModel: AssetModel?
    
    //MARK: - UI Compononets
    private lazy var  assetCodeLabel = AssetCodeLabel()
    
    private lazy var assetNameLabel: UILabel = {
        let fontSize = ATVCConsts.Layout.assetNameLabelFontSize
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: fontSize, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var assetSegmentLabel: UILabel = {
        let fontSize = ATVCConsts.Layout.assetSegmentLabelFontSize
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: fontSize, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var assetDisclosure: UIImageView = {
        let image = UIImage(systemName: IconSystemNames.infoFilled.name)?
            .withTintColor(.ownerBlue, renderingMode: .alwaysOriginal)
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var nameAndSegmanetStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
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
        consifigureStyle()
    }
    
    func configureViewHierarchy() {
        [assetNameLabel, assetSegmentLabel]
            .forEach { nameAndSegmanetStackView.addArrangedSubview($0) }
        
        [assetCodeLabel, nameAndSegmanetStackView, assetDisclosure]
            .forEach { addSubview($0) }
    }
    
    func configureConstraints() {
        
        assetCodeLabel.ownerLayout.applyConstraints {
            let leadingDistance = ATVCConsts.Layout.assetCodeLeadingDistance,
                heightSize = ATVCConsts.Layout.assetCodeHeightSize,
                widthSize = ATVCConsts.Layout.assetCodeWidthSize
            
            $0.centerY(at: self.centerYAnchor)
            $0.leading(at: self.leadingAnchor, distance: leadingDistance)
            $0.height(heightSize)
            $0.width(widthSize)
        }
        
        nameAndSegmanetStackView.ownerLayout.applyConstraints {
            let leadingDistance = ATVCConsts.Layout.nameAndSegmanetLeadingDistance,
                trailingDistance = ATVCConsts.Layout.nameAndSegmanetTrailingDistance
            
            $0.centerY(at: self.centerYAnchor)
            $0.leading(at: self.assetCodeLabel.trailingAnchor, distance: leadingDistance)
            $0.trailing(at: self.assetDisclosure.leadingAnchor, distance: trailingDistance)
        }
        
        assetDisclosure.ownerLayout.applyConstraints {
            let trailingDistance = ATVCConsts.Layout.assetDisclosureTrailingDistance,
                DSize = ATVCConsts.Layout.assetDisclosureSize
            
            $0.centerY(at: self.centerYAnchor)
            $0.trailing(at: self.trailingAnchor, distance: trailingDistance)
            $0.height(DSize)
            $0.width(DSize)
        }
    
    }
    
    func consifigureStyle() {
        backgroundColor = .clear
    }
    
    //MARK: - Setters
    
    func setAssetInformations(asset model: AssetModel) {
        self.assetCodeLabel.text = model.assetCode
        self.assetNameLabel.text = model.assetName
        self.assetSegmentLabel.text = model.assetSegment
    }
    
    
}

extension AssetTableViewCell {
    private struct ATVCConsts {
        private init() {}
        
        struct Layout {
            private init() {}
            static let assetNameLabelFontSize: CGFloat = 18
            static let assetSegmentLabelFontSize: CGFloat = 14
            
            static let assetCodeLeadingDistance: CGFloat = 10
            static let assetCodeHeightSize: CGFloat = 30
            static let assetCodeWidthSize: CGFloat = 70
            
            static let nameAndSegmanetLeadingDistance: CGFloat = 20
            static let nameAndSegmanetTrailingDistance: CGFloat = -20
            
            static let assetDisclosureTrailingDistance: CGFloat = -20
            static let assetDisclosureSize: CGFloat = 30
        }
    }
}

