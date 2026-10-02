//
//  TrailView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 06/06/2026.
//
import SwiftUI

struct TrailView: View {
    @Environment(\.dismiss) private var dismissNav
    @State private var isSheetPresented = true
    
    let trail: HikingTrailAttributes
    
    var body: some View {
        ZStack {
            MapView()
                .ignoresSafeArea()
            
            if !isSheetPresented {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                isSheetPresented = true
                            }
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.title)
                                .padding(10)
                                .background(.thinMaterial)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding(.trailing, 16)
                    }
                    Spacer()
                }
                .padding(.top, 50)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    isSheetPresented = false
                    dismissNav()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                            .font(.body.weight(.semibold))
                    }
                }
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            TrailDetailsView(trail: trail)
                .presentationDetents([.fraction(0.25), .medium, .large])
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
        }
    }
}
