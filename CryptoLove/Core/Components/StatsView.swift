//
//  StatsView.swift
//  CryptoLove
//
//  Created by Robert Nersesyan on 09.09.21.
//

import SwiftUI

struct StatsView: View {
    
    let stat: Stats
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: (stat.percentChange ?? 0) >= 0 ? 0: 180))
                
                Text(stat.percentChange?.asPercent() ?? "")
                    .font(.caption)
                    .bold()
            }.foregroundColor((stat.percentChange ?? 0) >= 0 ? Color.theme.green: Color.theme.red)
            .opacity(stat.percentChange == nil ? 0.0: 1.0)
        })
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatsView(stat: dev.stat1).previewLayout(.sizeThatFits).preferredColorScheme(.dark)
            StatsView(stat: dev.stat2).previewLayout(.sizeThatFits)
            StatsView(stat: dev.stat3).previewLayout(.sizeThatFits)
        }
    }
}
