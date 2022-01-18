//
//  TitleAndSubtitleVStackView.swift
//  Owner
//
//  Created by Paolo Prodossimo Lopes on 04/01/22.
//

import UIKit

final class TitleAndSubtitleVStackView: UIStackView {
    
    //MARK: - Properties
    
    private let title: String
    private let subtitle: String
    
    //MARK: - UI Components
    
    private lazy var assetNameLabel: UILabel = {
        let label = UILabel()
        label.text = self.title
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var assetSegmentLabel: UILabel = {
        let label = UILabel()
        label.text = self.subtitle
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    //MARK: - Constructor
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        super.init(frame: .zero)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func commonInit() {
        configureViewHierarchy()
        configureStyle()
    }
    
    private func configureViewHierarchy() {
        [assetNameLabel, assetSegmentLabel]
            .forEach {  self.addArrangedSubview($0) }
    }
    
    private func configureStyle() {
        axis = .vertical
        alignment = .center
    }
    
}
