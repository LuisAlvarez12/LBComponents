//
//  VerticalNoBorderLabelStyle 2.swift
//  LBComponents
//
//  Created by Luis Alvarez on 2/5/25.
//

import LBFoundation
import SwiftUI

public extension LabelStyle where Self == VerticalBorderLabelStyle {
    static var lbVerticalBorder: VerticalBorderLabelStyle { .init() }
}

public struct VerticalBorderLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
                .squareFrame(24)
                .bold()
            configuration.title
                .lineLimit(1, reservesSpace: true)
                .bold()
        }.padding(12)
            .widthAligned(.center)
            .background(currentAppTheme.surface.normal)
            .contentShape(.hoverEffect, .rect(cornerRadius: 12))
            .hoverEffect()
    }
}

#Preview {
    Features.addFeatures(features: [])
    return VStack {
        HStack {
            Label("Test Label", systemImage: "folder").labelStyle(.lbVerticalBorder)
            Label("Test Label", systemImage: "circle").labelStyle(.lbVerticalBorder)
            Label("Test Label", systemImage: "doc").labelStyle(.lbVerticalBorder)
                .foregroundStyle(.blue)
        }
        Label("Test Label", systemImage: "folder").labelStyle(.lbVerticalBorder)
        Label("Test Label", systemImage: "circle").labelStyle(.lbVerticalBorder)
        Label("Test Label", systemImage: "doc").labelStyle(.lbVerticalBorder)
            .foregroundStyle(.blue)
    }
}
