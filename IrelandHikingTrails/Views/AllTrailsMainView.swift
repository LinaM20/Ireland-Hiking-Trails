//
//  ContentView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 10/04/2026.
//

//add search
// favourites
import SwiftUI
struct  AllTrailsMainView: View {
    @State private var viewModel = HikingTrailViewModel()
            
    var body: some View {
        VStack {
            Text("Ireland Hiking Trails")
                .font(.largeTitle)
            
            switch viewModel.state {
            case .loading:
                AllTrailsSkeletonListView()
            case .success:
                AllTrailsListView(viewModel: viewModel)
            case .errorState(let error):
                Text(error)
            }
        }
        .task {
            await viewModel.loadTrails()
        }
    }
}

#Preview { AllTrailsMainView() }

