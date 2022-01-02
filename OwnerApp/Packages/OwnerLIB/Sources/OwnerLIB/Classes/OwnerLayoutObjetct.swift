import UIKit

public final class OwnerLayoutObjetct: NSObject {
    
    public typealias ApplyConstrantOwnerObject = (_ obj: OwnerLayoutObjectConstaints) -> Void
    
    private let support: UIView
    
    public init(_ support: UIView) {
        self.support = support
        self.support.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func applyConstraints(_ applyIn: ApplyConstrantOwnerObject) {
        let objectToAply = OwnerLayoutObjectConstaints(support)
        applyIn(objectToAply)
    }
    
}

