//
//  Double.swift
//  CryptoLove
//
//  Created by Robert Nersesyan on 14.06.21.
//

import Foundation


extension Double{
    private var currencyFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asCurrency() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }
    
    func asNumberString() -> String{
        return String(format: "%.2f", self)
    }
    
    func asPercent() -> String {
        return asNumberString() + "%"
    }
}
