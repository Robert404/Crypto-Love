//
//  UIApplication.swift
//  CryptoLove
//
//  Created by Robert Nersesyan on 17.06.21.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
