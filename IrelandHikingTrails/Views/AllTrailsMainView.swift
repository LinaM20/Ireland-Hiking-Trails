//
//  ContentView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 10/04/2026.
//

//add search
// favourites
import SwiftUI

struct AllTrailsMainView: View {
    @State private var viewModel = HikingTrailViewModel()
    @State private var searchText: String = ""
            
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .loading:
                    AllTrailsSkeletonListView()
                case .success:
                    AllTrailsListView(viewModel: viewModel)
                case .errorState(let error):
                    Text(error)
                }
            }
        }
        .searchable(text: Bindable(viewModel).searchText, placement: .navigationBarDrawer)
        .task {
            await viewModel.loadTrails()
        }
    }
}

#Preview { AllTrailsMainView() }

