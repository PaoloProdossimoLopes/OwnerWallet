import UIKit

public protocol BaseViewProtocol {
    
    func configureViewHierarcy()
    func configureConstraints()
    func configureStyle()
    
}

public extension BaseViewProtocol {
    
    func commonInit() {
        configureViewHierarcy()
        configureConstraints()
        configureStyle()
    }
    
    func configureStyle() {}
    
}
