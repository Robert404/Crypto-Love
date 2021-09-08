//
//  Stats.swift
//  CryptoLove
//
//  Created by Robert Nersesyan on 09.09.21.
//

import Foundation

struct Stats: Identifiable {
    
    var id = UUID().uuidString
    let title: String
    let value: String
    let percentChange: Double?
    
    init(title: String, value: String = "", percentChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentChange = percentChange
    }
}
