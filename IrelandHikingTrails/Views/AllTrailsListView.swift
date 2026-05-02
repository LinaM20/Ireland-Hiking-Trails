//
//  HikingTrailListView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 02/05/2026.
//
import SwiftUI

struct AllTrailsListView: View {
    let viewModel: HikingTrailViewModel
    
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
                                AllTrailsListCardView(
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
    }
}

#Preview {
    AllTrailsMainView()
}

