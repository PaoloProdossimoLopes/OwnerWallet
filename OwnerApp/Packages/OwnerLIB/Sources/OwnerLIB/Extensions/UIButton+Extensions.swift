import UIKit

public extension UIButton {
    
    /// User this function when you want to change image size inside of button
    /// - Parameter size: Size of image
    func setButtonImageSize(_ size: CGFloat) {
        self.setPreferredSymbolConfiguration(
            UIImage.SymbolConfiguration(pointSize: size),
            forImageIn: .normal
        )
    }
    
    static func configureAditionalButtons(target: Any?, imageSystemName: String, color: UIColor = .black,
                                   action: Selector, imageSize: CGFloat) -> UIButton {
        let image = UIImage(systemName: imageSystemName)?
            .withTintColor(color, renderingMode: .alwaysOriginal)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(target, action: action, for: .touchUpInside)
        button.setButtonImageSize(imageSize)
        return button
    }
    
}
