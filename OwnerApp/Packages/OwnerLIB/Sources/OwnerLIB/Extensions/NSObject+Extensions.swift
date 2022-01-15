import Foundation

public extension NSObject {
    
    func mockDecoder<T: Codable>(type: T.Type, from file: String) -> T {
        return Bundle.main.decode(type: type, from: file)
    }
    
}
