//
//  HikingTrailListView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 02/05/2026.
//
import SwiftUI

struct HikingTrailListView: View {
    @State private var viewModel = HikingTrailViewModel()
    @State private var isLoading: Bool = true
    
    var groupedTrails: [String: [HikingTrailAttributes]] {
        Dictionary(grouping: viewModel.hikingTrails, by: { $0.County ?? "Unknown"})
    }
    
    var body: some View {
        List {
            ForEach(groupedTrails.keys.sorted(), id: \.self) { county in
                Section {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(groupedTrails[county] ?? []) { trail in
                                HikingTrailListCardView(
                                    title: trail.Name ?? "Unknown Name",
                                    county: trail.County ?? "Unknown County",
                                    description: trail.Description ?? "Unknown Description"
                                )
                            }
                        }
                    }
                } header: {
                    Text(county)
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .listStyle(.plain)
        .task {
            await viewModel.loadTrails()
        }
    }
}

#Preview {
    HikingTrailMainView()
}

