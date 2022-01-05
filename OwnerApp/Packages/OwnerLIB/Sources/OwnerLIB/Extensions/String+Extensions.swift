import UIKit

public extension String {
    func formatterToBrazilianDate() -> String {
        let errorFormat = "--/--/--"
        
        let fromFormatter = DateFormatter()
        fromFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let oldDate: Date = fromFormatter.date(from: self)
        else { return errorFormat }
        
        let toFormatter = DateFormatter()
        toFormatter.dateFormat = "dd/MM/yy"
        
        let newDate = toFormatter.string(from: oldDate)
        
        return newDate
    }
}
