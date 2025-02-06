//
//  PrimaryStyle.swift
//  LBComponents
//
//  Created by Luis Alvarez on 2/5/25.
//


import SwiftUI
import LBFoundation

public extension ButtonStyle where Self == VerticalBorderButtonStyle {
    static var lbVerticalBorder: VerticalBorderButtonStyle { .init() }
}

public struct VerticalBorderButtonStyle: ButtonStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .labelStyle(.lbVerticalBorder)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    Features.addFeatures(features: [])
    return VStack {
        Button("Test", systemImage: "folder", action: {}).buttonStyle(.lbVerticalBorder)
    }
}
