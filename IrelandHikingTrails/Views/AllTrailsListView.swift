//
//  HikingTrailListView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 02/05/2026.
//
import SwiftUI

struct AllTrailsListView: View {
    @State private var path: [HikingTrailAttributes] = []
    let viewModel: HikingTrailViewModel
    
    var groupedTrails: [String: [HikingTrailAttributes]] {
        Dictionary(grouping: viewModel.hikingTrails, by: { $0.County ?? "Unknown"})
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(groupedTrails.keys.sorted(), id: \.self) { county in
                    Section {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(groupedTrails[county] ?? []) { trail in
                                    AllTrailsCardView(
                                        title: trail.Name ?? "Unknown Name",
                                        county: trail.County ?? "Unknown County",
                                        description: trail.Description ?? "Unknown Description",
                                        isLoading: viewModel.isLoading,
                                        onViewDetails: {
                                            path.append(trail)
                                        }
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
            .navigationDestination(for: HikingTrailAttributes.self) { trail in
                TrailDetailsView(trail: trail)
            }
        }
    }
}

#Preview {
    AllTrailsMainView()
}

