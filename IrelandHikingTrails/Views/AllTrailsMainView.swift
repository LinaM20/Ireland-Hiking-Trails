//
//  ContentView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 10/04/2026.
//

import SwiftUI
struct  AllTrailsMainView: View {
    @State private var viewModel = HikingTrailViewModel()
            
    var body: some View {
        VStack {
            Text("Ireland Hiking Trails")
                .font(.largeTitle)
            
            if viewModel.isLoading {
                AllTrailsSkeletonListView()
            } else {
                AllTrailsListView(viewModel: viewModel)
            }
        }
        .task {
            await viewModel.loadTrails()
        }
    }
}

#Preview { AllTrailsMainView() }

