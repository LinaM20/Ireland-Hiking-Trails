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
    
    var countiesDict: [String: [HikingTrailAttributes]] {
        var multiCountyTrails: [String: [HikingTrailAttributes]] = [:]
        for trail in viewModel.filteredTrails {
            let countyNames = trail.County ?? "Unknown County"
            let counties = countyNames.split(separator: ",")
            for countySegment in counties {
                let cleanedCounty = countySegment.trimmingCharacters(in: .whitespaces)
                multiCountyTrails[cleanedCounty, default: []].append(trail)
            }
        }
        return multiCountyTrails
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(countiesDict.keys.sorted(), id: \.self) { county in
                    Section {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(countiesDict[county] ?? []) { trail in
                                    AllTrailsCardView(
                                        title: trail.Name ?? "Unknown Name",
                                        county: trail.County ?? "Unknown County",
                                        description: trail.Description ?? "No description available",
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
