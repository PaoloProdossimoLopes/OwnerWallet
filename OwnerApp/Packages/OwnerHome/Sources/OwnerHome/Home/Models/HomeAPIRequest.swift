import Foundation
import OwnerLIB

struct HomeAPIRequest: RequestProtocol  {
    
    var autoDescribing: String {
        String(describing: self)
        .replacingOccurrences(of: "()", with: "")
    }
    
    var urlString: String { return "https://jsonplaceholder.typicode.com/posts" }
}
