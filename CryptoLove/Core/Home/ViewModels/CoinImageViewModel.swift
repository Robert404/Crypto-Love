//
//  CoinImageViewModel.swift
//  CryptoLove
//
//  Created by Robert Nersesyan on 16.06.21.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private var cancellable = Set<AnyCancellable>()
    private let coin: Coin
    private let imageService: CoinImageService
    
    init(coin: Coin) {
        self.coin = coin
        self.imageService = CoinImageService(coin: coin)
        self.addSub()
        self.isLoading = true
    }
    
    private func addSub() {
        imageService.$image.sink { [weak self] (_) in
            self?.isLoading = false
        } receiveValue: { [weak self] returnedImage in
            self?.image = returnedImage
        }
        .store(in: &cancellable)
    }
}
