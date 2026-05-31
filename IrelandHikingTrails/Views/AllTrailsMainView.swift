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
    @Bindable var viewModel: HikingTrailViewModel

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
