//
//  ShimmerModifierView.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 30/05/2026.
//
import SwiftUI

struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0),
                            .init(color: .white.opacity(0.5), location: 0.5),
                            .init(color: .clear, location: 1)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: geometry.size.width * 2) // Double width for smooth transition
                    .offset(x: -geometry.size.width + (phase * geometry.size.width * 2))
                }
            )
            .mask(content) // Ensures the shimmer only shows on the shape of the view
            .onAppear {
                withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
    }
}

// Extension to make it easy to use
extension View {
    @ViewBuilder
    func shimmering(when isLoading: Bool) -> some View {
        if isLoading {
            self.modifier(ShimmerModifier())
        } else {
            self
        }
    }
}
