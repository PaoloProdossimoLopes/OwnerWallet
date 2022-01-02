import UIKit

public final class OwnerLayoutObjectConstaints: NSObject {
    
    private let support: UIView
    
    public init(_ support: UIView) {
        self.support = support
    }
    
    public func top(at reference: NSLayoutYAxisAnchor, distance: CGFloat = 0) {
        self.support.topAnchor.constraint(equalTo: reference, constant: distance).isActive = true
    }
    
    public func leading(at reference: NSLayoutXAxisAnchor, distance: CGFloat = 0) {
        self.support.leadingAnchor.constraint(equalTo: reference, constant: distance).isActive = true
    }
    
    public func trailing(at reference: NSLayoutXAxisAnchor, distance: CGFloat = 0) {
        self.support.trailingAnchor.constraint(equalTo: reference, constant: distance).isActive = true
    }
    
    public func bottom(at reference: NSLayoutYAxisAnchor, distance: CGFloat = 0) {
        self.support.bottomAnchor.constraint(equalTo: reference, constant: distance).isActive = true
    }
    
    public func centerX(at reference: NSLayoutXAxisAnchor, distance: CGFloat = 0) {
        self.support.centerXAnchor.constraint(equalTo: reference, constant: distance).isActive = true
    }
    
    public func centerY(at reference: NSLayoutYAxisAnchor, distance: CGFloat = 0) {
        self.support.centerYAnchor.constraint(equalTo: reference, constant: distance).isActive = true
    }
    
    public func height(_ size: CGFloat) {
        self.support.heightAnchor.constraint(equalToConstant: size).isActive = true
    }
    
    public func width(_ size: CGFloat) {
        self.support.widthAnchor.constraint(equalToConstant: size).isActive = true
    }
    
}
