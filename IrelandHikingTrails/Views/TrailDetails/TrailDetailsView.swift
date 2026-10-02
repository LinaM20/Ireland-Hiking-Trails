//
//  TrailDetailsView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 06/06/2026.
//
import SwiftUI

struct TrailDetailsView: View {

    let trail: HikingTrailAttributes

    var body: some View {
        Text(trail.Name ?? "none")
    }
}
