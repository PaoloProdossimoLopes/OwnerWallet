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
            case .present: self.navigationController?.present(viewController, animated: true, completion: nil)
        }
    }
    
    func close(_ type: Close) {
        switch type {
            case .pop:
                self.navigationController?.popViewController(animated: true)
            case .dissmis:
                self.dismiss(animated: true, completion: nil)
        }
    }
    
}

public enum Close {
    case pop
    case dissmis
}

