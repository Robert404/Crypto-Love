//
//  CryptoLoveApp.swift
//  CryptoLove
//
//  Created by Robert Nersesyan on 13.06.21.
//

import SwiftUI

@main
struct CryptoLoveApp: App {
    
    @StateObject private var viewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    .navigationBarHidden(true)
            }
            .environmentObject(viewModel)
        }
    }
}
