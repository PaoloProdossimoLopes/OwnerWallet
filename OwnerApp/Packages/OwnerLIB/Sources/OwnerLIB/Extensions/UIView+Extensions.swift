import UIKit

public extension UIView {
    
    var ownerLayout: OwnerLayoutObjetct {
        let obj = OwnerLayoutObjetct(self)
        return obj
    }
    
}
