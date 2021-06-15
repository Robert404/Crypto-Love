//
//  CoinDataService.swift
//  CryptoLove
//
//  Created by Robert Nersesyan on 15.06.21.
//

import Foundation
import Combine


class CoinDataService {
    @Published var coins: [Coin] = []
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoins in
                self?.coins = returnedCoins
                self?.coinSubscription?.cancel()
            })
        }
    }
