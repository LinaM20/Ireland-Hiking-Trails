//
//  ContentView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 10/04/2026.
//

import SwiftUI
struct HikingTrailMainView: View {
    @State private var viewModel = HikingTrailViewModel()
    @State private var isLoading: Bool = true
            
    var body: some View {
        VStack {
            Text("Ireland Hiking Trails")
                .font(.largeTitle)
            
            if viewModel.isLoading {
                HikingTrailSkeletonListView()
            } else {
                HikingTrailListView()
            }
        }
    }
}

#Preview { HikingTrailMainView() }

