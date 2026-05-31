//
//  HikingTrailSkeletonListView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 02/05/2026.
//
import SwiftUI

struct AllTrailsSkeletonListView: View {
    var body: some View {
        List {
            ForEach(0..<3, id: \.self) { _ in
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(0..<3, id: \.self) { _ in
                                SkeletonCard()
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
        }
        .listStyle(.plain)
        .shimmering(when: true)
    }
}
