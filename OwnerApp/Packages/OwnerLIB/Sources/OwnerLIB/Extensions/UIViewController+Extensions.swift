import UIKit

public enum Show {
    case push
    case present
}

public extension UIViewController {
    
    func show(_ viewController: UIViewController, navigate type: Show) {
        switch type {
            case .push: self.navigationController?.pushViewController(viewController,
                                                                     animated: true)
            case .present: self.present(viewController, animated: true,
                                        completion: nil)
        }
    }
    
}

