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
    var hikingTrails: [HikingTrailAttributes] = []
    var isLoading = true
    
    private let service = HikingTrailService()
    
    func loadTrails() async {
        isLoading = true
        //defer { isLoading = false }
        do {
            let fetchedTrails = try await service.fetchTrails()
            self.hikingTrails = fetchedTrails
        } catch {
            print("Error fetching trails: \(error)")
        }
        isLoading = false
    }
}

