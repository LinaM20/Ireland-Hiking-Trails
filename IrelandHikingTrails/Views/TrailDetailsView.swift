//
//  TrailDetailsView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 04/05/2026.
//
import SwiftUI

struct TrailDetailsView: View {
    
    let trail: HikingTrailAttributes
    
    var body: some View {
        Text("TrailDetailsView, \(trail.Name ?? "")")
    }
}
