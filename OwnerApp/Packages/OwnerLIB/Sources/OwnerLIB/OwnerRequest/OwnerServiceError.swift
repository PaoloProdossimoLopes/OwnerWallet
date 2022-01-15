import Foundation

public enum OwnerServiceError: Int, Error {
    
    case internalServerError = 500
    case blocked = 403
    case notFound = 404
    case unavilableService = 503
    case timeOut = 504
    
    var decribeError: String {
        return "Fail"
    }
    
}
