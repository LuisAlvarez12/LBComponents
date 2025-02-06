//
//  VerticalNoBorderLabelStyle.swift
//  LBComponents
//
//  Created by Luis Alvarez on 2/5/25.
//

import SwiftUI
import LBFoundation

public extension LabelStyle where Self == VerticalNoBorderLabelStyle {
    static var lbVerticalNoBorder: VerticalNoBorderLabelStyle { .init() }
}

public struct VerticalNoBorderLabelStyle: LabelStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
                .squareFrame(24)
            configuration.title
                .lineLimit(1, reservesSpace: true)
                .bold()
        }
    }
}

#Preview {
    Features.addFeatures(features: [])
    return VStack {
        Label("Test Label", systemImage: "folder").labelStyle(.lbVerticalNoBorder)
        Label("Test Label", systemImage: "circle").labelStyle(.lbVerticalNoBorder)
        Label("Test Label", systemImage: "doc").labelStyle(.lbVerticalNoBorder)
            .foregroundStyle(.blue)
    }
}

