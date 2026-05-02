//
//  HikingTrailSkeletonListView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 02/05/2026.
//
import SwiftUI

struct HikingTrailSkeletonListView: View {
    
    enum Constants {
        static let cardPadding: CGFloat = 15
        static let cardRadius: CGFloat = 10
        static let cardShadowRadius: CGFloat = 5
        static let cardHeight: CGFloat = 340
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HikingTrailListCardView(title: "", county: "", description: "")
        }
    }
}

#Preview {
    HikingTrailMainView()
}
