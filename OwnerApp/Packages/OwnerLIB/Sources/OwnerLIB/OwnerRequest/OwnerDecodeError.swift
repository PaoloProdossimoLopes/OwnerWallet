import Foundation

public enum OwnerDecodeError: Error {
    
    case dataCorrupted
    case keyNotFound
    case typeMisMatch
    case valueNotFound
    case defaultError
    
    var decribeError: String {
        switch self {
        case .dataCorrupted:
            return "An indication that the data is corrupted or otherwise invalid."
        case .keyNotFound:
            return "An indication that a keyed decoding container was asked for an entry for the given key, but did not contain one."
        case .typeMisMatch:
            return "An indication that a value of the given type could not be decoded because it did not match the type of what was found in the encoded payload."
        case .valueNotFound:
            return "An indication that a non-optional value of the given type was expected, but a null value was found."
        case .defaultError:
            return "Error to decode object"
        }
    }
    
}
