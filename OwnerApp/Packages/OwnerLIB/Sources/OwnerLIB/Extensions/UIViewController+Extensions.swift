import UIKit

public enum Show {
    case push
    case present
}

public extension UINavigationController {
    
    func show(_ viewController: UIViewController, navigate type: Show) {
        switch type {
            case .push: self.pushViewController(viewController,
                                                                     animated: true)
            case .present: self.present(viewController, animated: true, completion: nil)
        }
    }
    
    func close(_ type: Close, completion: (() -> Void)? = nil) {
        switch type {
            case .pop:
                self.navigationController?.popViewController(animated: true)
            case .dissmis:
            self.dismiss(animated: true, completion: {  completion?() })
            return
        }
        completion?()
    }
    
}

public enum Close {
    case pop
    case dissmis
}

