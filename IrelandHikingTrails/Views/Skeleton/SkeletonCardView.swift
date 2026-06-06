//
//  SkeletonCardView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 30/05/2026.
//

import SwiftUI

struct SkeletonCard: View {
    
    enum Constants {
        static let cornerRadius: CGFloat = 4
        static let rectangleHeight: CGFloat = 10
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Title placeholder - Responsive Height
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Color.gray.opacity(0.3))
                .frame(height: UIScreen.main.bounds.height * 0.03) // 3% of screen height
                .frame(maxWidth: .infinity)
            
            // County placeholder - 40% of the card width
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: geo.size.width * 0.4, height: 15)
            }
            .frame(height: 15) // Explicit height for GeometryReader container
            
            // Description placeholder - Stacked flexible bars
            VStack(alignment: .leading, spacing: 8) {
                RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(Color.gray.opacity(0.1))
                    .frame(height: Constants.rectangleHeight)
                RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(Color.gray.opacity(0.1))
                    .frame(height: Constants.rectangleHeight)
                
                // Bottom line is usually shorter in text blocks
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(Color.gray.opacity(0.1))
                        .frame(width: geo.size.width * 0.6, height: Constants.rectangleHeight)
                }
                .frame(height: 10)
            }
            
            Spacer()
            
            // Button placeholder - Adaptive to card width
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 44) // Standard iOS touch target height
                .frame(maxWidth: .infinity)
        }
        .padding(16)
        // Keep your square logic
        .containerRelativeFrame(.horizontal) { size, _ in size * 0.85 }
        .aspectRatio(1, contentMode: .fit)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray6))
        )
        .shimmering(when: true)
        .padding(.horizontal, 8)
        .padding(.vertical, 10)
    }
}
