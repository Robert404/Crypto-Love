//
//  HomeView.swift
//  CryptoLove
//
//  Created by Robert Nersesyan on 14.06.21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    @State private var showPortfolio: Bool = false
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            
            VStack{
                header
                
                List {
                    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: false)
                }.listStyle(PlainListStyle())
                
                //padding(.horizontal) WTF is this line???
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .navigationBarHidden(true)
                .environmentObject(HomeViewModel())
        }
    }
}

extension HomeView {
    private var header: some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus": "info")
                .animation(.none)
                .background(CircleButtonAnimationView(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? "Portfolio": "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180: 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        //padding(.horizontal) WTF is this line???
    }
}
