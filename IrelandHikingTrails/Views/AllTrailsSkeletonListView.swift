//
//  HikingTrailSkeletonListView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 02/05/2026.
//
import SwiftUI

struct AllTrailsSkeletonListView: View {

    enum Constants {
        static let placeholderCounties: [String] = ["County One", "County Two", "County Three"]
        static let cardsPerRow = 3
    }
    
    var body: some View {
        List {
            ForEach(Constants.placeholderCounties, id: \.self) { county in
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(0..<Constants.cardsPerRow, id: \.self) { _ in
                                AllTrailsCardView(title: "", county: "", description: "", isLoading: true)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                } header: {
                    Text(county)
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .redacted(reason: .placeholder)
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    AllTrailsMainView()
}
