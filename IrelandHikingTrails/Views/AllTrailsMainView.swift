//
//  AllTrailsMainView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 31/05/2026.
//
import SwiftUI

struct AllTrailsMainView: View {
    @State private var viewModel = HikingTrailViewModel()

    var body: some View {
        TabView {
            AllTrailsContentView(viewModel: viewModel)
                .tabItem {
                    Label("All Trails", systemImage: "map")
                }

            FavouritedTrailsView()
                .tabItem {
                    Label("Favourites", systemImage: "star")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

private struct AllTrailsContentView: View {
    let viewModel: HikingTrailViewModel
    @State private var path: [HikingTrailAttributes] = []

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 0) {
                switch viewModel.state {
                case .loading:
                    AllTrailsSkeletonListView()
                case .success:
                    AllTrailsListView(path: $path, viewModel: viewModel)
                case .errorState(let error):
                    Text(error)
                }
            }
            .navigationTitle("Ireland 🇮🇪 Hiking Trails")
            .searchable(text: Bindable(viewModel).searchText, placement: .navigationBarDrawer)
            .navigationDestination(for: HikingTrailAttributes.self) { selectedTrail in
                TrailView(trail: selectedTrail)
            }
        }
        .task {
            await viewModel.loadTrails()
        }
    }
}
