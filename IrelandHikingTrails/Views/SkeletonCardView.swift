//
//  SkeletonCardView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 30/05/2026.
//

import SwiftUI

struct SkeletonCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Title placeholder
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 25)
                .frame(maxWidth: .infinity)
            
            // County placeholder
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 100, height: 15)
            
            // Description placeholder
            VStack(alignment: .leading, spacing: 8) {
                RoundedRectangle(cornerRadius: 4).fill(Color.gray.opacity(0.1)).frame(height: 10)
                RoundedRectangle(cornerRadius: 4).fill(Color.gray.opacity(0.1)).frame(height: 10)
                RoundedRectangle(cornerRadius: 4).fill(Color.gray.opacity(0.1)).frame(height: 10).frame(width: 150)
            }
            
            Spacer()
            
            // Button placeholder
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 40)
        }
        .padding(16)
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
