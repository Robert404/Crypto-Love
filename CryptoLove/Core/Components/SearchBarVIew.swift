//
//  SearchBarVIew.swift
//  CryptoLove
//
//  Created by Robert Nersesyan on 17.06.21.
//

import SwiftUI

struct SearchBarVIew: View {
    
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.theme.secondaryText)
            
            TextField("Search...", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0: 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25).fill(Color.theme.background))
        .shadow(color: Color.theme.accent.opacity(0.2), radius: 10, x: 0.0, y: 0.0)
    }
}

struct SearchBarVIew_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarVIew(searchText: .constant(""))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
