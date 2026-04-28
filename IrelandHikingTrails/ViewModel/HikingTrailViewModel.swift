//
//  HikingTrails.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 10/04/2026.
//
import SwiftUI


@Observable
class HikingTrailViewModel {
    var hikingTrails: [HikingTrailAttributes] = []
    var isLoading = false
    
    private let service = HikingTrailService()
    
    func loadTrails() async {
        isLoading = true
        do {
            let fetchedTrails = try await service.fetchTrails()
            self.hikingTrails = fetchedTrails
        } catch {
            print("Error fetching trails: \(error)")
            
        }
        isLoading = false
    }
}

