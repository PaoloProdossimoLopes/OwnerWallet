import Foundation

public extension Double {
    
    /// Convert your Double value to String with Brazilian formatation
    /// - Returns: String formatted with this format: R$ XX,XX
    func getWithCurrencyFormatation() -> String {
        let nsNumber = self as NSNumber
        let numberFormatter = NumberFormatter()
        
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.currencySymbol = "R$"
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "pt-br")
        
        let value = numberFormatter.string(from: nsNumber)
        return value ?? "--,--"
    }
    
    /// Convert your Double value to String with Brazilian formatation
    /// - Returns: String formatted with this format: R$ X.XM
    func getCurrencyWithAbreviateFormatation() -> String {
        
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        let billion = number / 1000000000
        
        if billion >= 1.0 {
            return "\((billion*10)/10)B"
        } else if million >= 1.0 {
            return "\((million*10)/10)M"
        } else if thousand >= 1.0 {
            return ("\((thousand*10/10))K")
        } else {
            return "\(Int(number))"
        }
        
    }
    
    func getQuantityFormatation() -> String {
        let nsNumber = self as NSNumber
        let nf = getQunatityFormatter()
        let value = nf.string(from: nsNumber) ?? "-,--"
        return value
    }
    
    func getQuantityFormatationWithUnit() -> String {
        let nsNumber = self as NSNumber
        let nf = getQunatityFormatter()
        nf.positiveSuffix = " un"
        let value = nf.string(from: nsNumber) ?? "-,--"
        return value
    }
    
    private func getQunatityFormatter() -> NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.decimalSeparator = ","
        nf.minimumFractionDigits = 3
        nf.minimumIntegerDigits = 1
        return nf
    }
    
}


/*
 //MARK: OTHER METHOD
 
 extension Double {
     func reduceScale(to places: Int) -> Double {
         let multiplier = pow(10, Double(places))
         let newDecimal = multiplier * self // move the decimal right
         let truncated = Double(Int(newDecimal)) // drop the fraction
         let originalDecimal = truncated / multiplier // move the decimal back
         return originalDecimal
     }
 }

 func formatNumber(_ n: Int) -> String {
     let num = abs(Double(n))
     let sign = (n < 0) ? "-" : ""

     switch num {
     case 1_000_000_000...:
         var formatted = num / 1_000_000_000
         formatted = formatted.reduceScale(to: 1)
         return "\(sign)\(formatted)B"

     case 1_000_000...:
         var formatted = num / 1_000_000
         formatted = formatted.reduceScale(to: 1)
         return "\(sign)\(formatted)M"

     case 1_000...:
         var formatted = num / 1_000
         formatted = formatted.reduceScale(to: 1)
         return "\(sign)\(formatted)K"

     case 0...:
         return "\(n)"

     default:
         return "\(sign)\(n)"
     }
 }
 
 */
