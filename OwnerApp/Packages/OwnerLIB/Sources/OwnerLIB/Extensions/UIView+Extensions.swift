import UIKit

public extension UIView {
    
    var ownerLayout: OwnerLayoutObjetct {
        let obj = OwnerLayoutObjetct(self)
        return obj
    }
    
    /// Create a divider on any view, your only need to setup at current view are working the top and bottom reference.
    /// - Parameters:
    ///   - color: It's view color
    ///   - height: height of view
    /// - Returns: return the Divider formatted and with your height and width foratted too
    func dividerView(_ color: UIColor = .ownerBlue, height: CGFloat = 1) -> UIView {
        let view = UIView()
        view.backgroundColor = color.withAlphaComponent(0.6)
        self.addSubview(view)
        view.ownerLayout.applyConstraints {
            $0.height(height)
            $0.leading(at: self.leadingAnchor)
            $0.trailing(at: self.trailingAnchor)
        }
        return view
    }
    
    
}
