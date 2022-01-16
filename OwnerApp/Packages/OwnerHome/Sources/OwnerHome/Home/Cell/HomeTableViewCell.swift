//
//  HomeTableViewCell.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 15/01/22.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    
    static let registerName: String = String(describing: self)
    
    private lazy var assetNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var assetSegemntLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var assetCodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray.withAlphaComponent(0.8)
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var assetImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var assetDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 5
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        
        let headerVStack = UIStackView(arrangedSubviews: [assetNameLabel, assetSegemntLabel])
        headerVStack.axis = .vertical
        headerVStack.spacing = 5
        
        let headerHStackView = UIStackView(arrangedSubviews: [headerVStack, assetImageView])
        headerHStackView.axis = .horizontal
        headerHStackView.spacing = 50
        
        let mainsVStackView = UIStackView(arrangedSubviews: [
            headerHStackView, assetDescriptionLabel, assetCodeLabel
        ])
        mainsVStackView.axis = .vertical
        mainsVStackView.spacing = 15
        
        return mainsVStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        self.addSubview(mainStackView)
    }
    
    private func configureConstraints() {
        
        assetImageView.ownerLayout.applyConstraints {
            $0.width(40)
            $0.height(40)
        }
        
        mainStackView.ownerLayout.applyConstraints {
            $0.top(at: self.safeAreaLayoutGuide.topAnchor, distance: 20)
            $0.leading(at: self.leadingAnchor, distance: 20)
            $0.trailing(at: self.trailingAnchor, distance: -20)
            $0.bottom(at: self.bottomAnchor, distance: -20)
        }
    }
    
    private func configureStyle() {
        backgroundColor = .white
        
        let view = UIView() //For spacing btween cell
        view.backgroundColor = UIColor.white //For spacing btween cell
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 0.1
        self.backgroundView = view //For spacing btween cell
    }
    
    override func layoutSubviews() { //For spacing btween cell
        super.layoutSubviews() //For spacing btween cell
        backgroundView?.frame = backgroundView?.frame.inset(by: UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)) ?? CGRect.zero //For spacing btween cell
    } //For spacing btween cell
    
    func setupInformations(_ model: ListOfMainAssets) {
        assetNameLabel.text = model.assetName
        assetCodeLabel.text = model.assetCode
        assetSegemntLabel.text = model.assetSegment
        assetDescriptionLabel.text = model.assetDescription
        assetImageView.image = model.image
    }
    
}
