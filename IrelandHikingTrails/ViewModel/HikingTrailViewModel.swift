//
//  HikingTrails.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 10/04/2026.
//
import SwiftUI
import Combine

@Observable
class HikingTrailViewModel {
    var state: HikingTrailStates = .loading
    var hikingTrails: [HikingTrailAttributes] = []
    var searchText: String = ""
    
    private let service = HikingTrailService()
    
    var filteredTrails: [HikingTrailAttributes] {
        if searchText.isEmpty {
            return hikingTrails
        } else {
            return hikingTrails.filter { trail in
                let nameMatch = trail.Name?.localizedCaseInsensitiveContains(searchText) ?? false
                let countyMatch = trail.County?.localizedCaseInsensitiveContains(searchText) ?? false
                return nameMatch || countyMatch
            }
        }
    }
    
    func loadTrails() async {
        do {
            let fetchedTrails = try await service.fetchTrails()
            self.hikingTrails = fetchedTrails
            state = .success
        } catch {
            state = .errorState("Error fetching trails: \(error)")
        }
    }
}

