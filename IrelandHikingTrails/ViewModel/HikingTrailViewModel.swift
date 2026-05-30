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
    
    private let service = HikingTrailService()
    
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

