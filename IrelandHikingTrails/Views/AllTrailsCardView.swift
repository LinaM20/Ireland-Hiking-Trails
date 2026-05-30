//
//  HikingTrailListCardView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 25/04/2026.
//
import SwiftUI

struct AllTrailsCardView: View {
    
    enum Constants {
        static let cardPadding: CGFloat = 15
        static let cardRadius: CGFloat = 10
        static let cardShadowRadius: CGFloat = 5
        static let cardHeight: CGFloat = 340
        static let skeletonCornerRadius: CGFloat = 6
        static let skeletonHeight: CGFloat = 20
        static let skeletonButton: CGFloat = 150
    }
    
    let title: String
    let county: String
    let description: String
    let state: HikingTrailStates
    
    var onViewDetails:(() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(Font.title)
                    .fixedSize(horizontal: false, vertical: true)
                Text(county)
                    .font(Font.headline)

            }
            .padding(Constants.cardPadding)
            
            Text(description)
            .font(Font.subheadline)
            .padding(Constants.cardPadding)

            Spacer()
            Button {
                onViewDetails?()
            } label: {
                if state == .loading {
                    RoundedRectangle(cornerRadius: Constants.skeletonCornerRadius)
                        .fill(Color.secondary.opacity(0.1))
                        .frame(width: Constants.skeletonButton, height: Constants.skeletonHeight)
                        .redacted(reason: .placeholder)
                } else {
                    Text("View Details")
                }
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
