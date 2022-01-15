import UIKit
import OwnerLIB

typealias HAPIProtocol = (OwnerRequester & HomeAPIProtocol)

protocol HomeAPIProtocol {
    func fetchAssets(_ completion: ([ListOfMainAssets]) -> Void)
}

final class HomeAPI: HAPIProtocol {
    
    static let shared:  HomeAPI = .init()
    
    private override init() {}
    
    func fetchAssets(_ completion: ([ListOfMainAssets]) -> Void) {
        let request = HomeAPIRequest()
        self.performURL(request, type: [ListOfMainAssets].self) { result in
            
        }
//        let mock = self.mockDecoder(type: [ListOfMainAssets].self,
//                                    from: "AssetsHomeAPIMock.json")
//        completion(mock)
    }
    
}
