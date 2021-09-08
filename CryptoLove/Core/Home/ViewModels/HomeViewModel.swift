//
//  HomeViewModel.swift
//  CryptoLove
//
//  Created by Robert Nersesyan on 15.06.21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var stats: [Stats] = [
        Stats(title: "Market Cap", value: "Value", percentChange: 1),
        Stats(title: "Market Cap", value: "Value", percentChange: 15.2),
        Stats(title: "Market Cap", value: "Value", percentChange: -7.2)
    ]
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    @Published var searchText: String = ""
    
    private let data = CoinDataService()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        data.$coins.sink { [weak self] returnedCoins in
            self?.allCoins = returnedCoins
        }
        .store(in: &cancellable)
    
        
        $searchText
            .combineLatest(data.$coins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filteredCoins)
            .sink{ [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }.store(in: &cancellable)
    }
    
    
    private func filteredCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else { return coins }
        
        let lowerCased = text.lowercased()
    
        return coins.filter { coin -> Bool in
            return coin.name.lowercased().contains(lowerCased) ||
                coin.symbol.lowercased().contains(lowerCased) ||
                coin.id.lowercased().contains(lowerCased)
        }
    }
}
