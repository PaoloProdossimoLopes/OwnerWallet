import Foundation

public extension Double {
    
    /// Convert your Double value to String with Brazilian formatation
    /// - Returns: String formatted with this format: R$ XX,XX
    func getWithCurrencyFormatation() -> String {
        let nsNumber = self as NSNumber
        let numberFormatter = NumberFormatter()
        numberFormatter.currencySymbol = "R$"
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "pt-br")
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.minimumFractionDigits = 2
        let value = numberFormatter.string(from: nsNumber)
       return value ?? "--,--"
    }
    
    func getQuantityFormatation() -> String {
        let nsNumber = self as NSNumber
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.decimalSeparator = ","
        nf.minimumFractionDigits = 3
        nf.minimumIntegerDigits = 1
        let value = nf.string(from: nsNumber) ?? "-,--"
        return value
    }
    
}
