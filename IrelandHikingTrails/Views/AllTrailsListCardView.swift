//
//  HikingTrailListCardView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 25/04/2026.
//
import SwiftUI

struct AllTrailsListCardView: View {
    
    enum Constants {
        static let cardPadding: CGFloat = 15
        static let cardRadius: CGFloat = 10
        static let cardShadowRadius: CGFloat = 5
        static let cardHeight: CGFloat = 340
    }
    
    let title: String
    let county: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Font.title)
                .padding(Constants.cardPadding)
                .fixedSize(horizontal: false, vertical: true)
            
            VStack(alignment: .leading) {
                Text(county)
                    .font(Font.headline)
                Text(description)
                    .font(Font.subheadline)
            }
            .padding(Constants.cardPadding)
            
            Spacer()
            
            Button("More Info") {
            }
            .padding(Constants.cardPadding)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .aspectRatio(1, contentMode: .fit)
        .background(
            RoundedRectangle(cornerRadius: Constants.cardRadius)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.2), radius: Constants.cardShadowRadius)
        )
        .frame(height: Constants.cardHeight)
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
    }
}
