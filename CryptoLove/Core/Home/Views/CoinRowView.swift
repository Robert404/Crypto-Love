//
//  CoinRowView.swift
//  CryptoLove
//
//  Created by Robert Nersesyan on 14.06.21.
//

import SwiftUI

struct CoinRowView: View {
    
    var coin: Coin
    let showHoldingsColumn: Bool
    var body: some View {
        HStack(spacing: 0){
            
            leftColumn
            
            Spacer()
            if showHoldingsColumn {
                middleColumn
            }
            
            rightColumn
        }.font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
        
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}


extension CoinRowView{
    private var leftColumn: some View {
        HStack{
            Text("\(coin.rank)")
                .foregroundColor(Color.theme.secondaryText)
                .padding(10)
            
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .padding(.leading, 7)
        }
    }
}

extension CoinRowView {
    private var middleColumn: some View {
        VStack{
            VStack(alignment: .trailing){
                Text(coin.currentHoldingsValue.asCurrency())
                    .bold()
                
                Text((coin.currentHoldings ?? 0).asNumberString())
            }.foregroundColor(Color.theme.accent)
        }
    }
}


extension CoinRowView {
    private var rightColumn: some View {
        VStack(alignment: .trailing){
            Text(coin.currentPrice.asCurrency())
                .foregroundColor(Color.theme.accent)
            
            Text(coin.priceChangePercentage24H?.asPercent() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.green: Color.red)
            
        }.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
