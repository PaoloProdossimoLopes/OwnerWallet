import UIKit
import OwnerLIB

typealias HAPIProtocol = (OwnerRequester & HomeAPIProtocol)

protocol HomeAPIProtocol {
    func fetchAssets(_ completion: @escaping ([ListOfMainAssets]) -> Void)
}

final class HomeAPI: HAPIProtocol {
    
    static let shared:  HomeAPI = .init()
    
    private override init() {}
    
    func fetchAssets(_ completion: @escaping ([ListOfMainAssets]) -> Void) {
//        let request = HomeAPIRequest()
//        self.performURL(request, type: [ListOfMainAssets].self) { result in
//            switch result {
//            case .success(let response):
//                completion(response)
//            case .failure(_):
//                break
//            }
//        }
        let mock = self.mockDecoder(type: [ListOfMainAssets].self,
                                    from: "AssetsHomeAPIMock.json")
        completion(mock)
    }
    
}
