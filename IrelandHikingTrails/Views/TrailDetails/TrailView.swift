//
//  TrailView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 06/06/2026.
//
import SwiftUI

struct TrailView: View {
    @State private var isSheetPresented = true
    @State private var drawerHeight: CGFloat = 200
    
    let trail: HikingTrailAttributes
    
    var body: some View {
        ZStack(alignment: .bottom) {
            MapView()
                .sheet(isPresented: $isSheetPresented) {
                    TrailDetailsView(trail: trail, currentHeight: $drawerHeight)
                        .presentationDetents([.medium, .large])
                }
        }
    }
}
