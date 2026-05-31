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
    
    var uniqueCounties: [String: [HikingTrailAttributes]] {
        Dictionary(grouping: viewModel.filteredTrails) { trail in
            let uniqueCounty = trail.County ?? "Unknown County"
            return uniqueCounty.split(separator: ",").first?.trimmingCharacters(in: .whitespaces) ?? "Unknown County"        }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(uniqueCounties.keys.sorted(), id: \.self) { county in
                    Section {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(uniqueCounties[county] ?? []) { trail in
                                    AllTrailsCardView(
                                        title: trail.Name ?? "Unknown Name",
                                        county: trail.County ?? "Unknown County",
                                        description: trail.Description ?? "Unknown Description",
                                        state: viewModel.state,
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
