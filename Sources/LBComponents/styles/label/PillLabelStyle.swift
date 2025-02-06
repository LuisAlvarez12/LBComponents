//
//  VerticalNoBorderLabelStyle 2.swift
//  LBComponents
//
//  Created by Luis Alvarez on 2/5/25.
//

import LBFoundation
import SwiftUI

public extension LabelStyle where Self == PillLabelStyle {
    static var lbPill: PillLabelStyle { .init() }
}

public struct PillLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .squareFrame(18)
                .bold()
            configuration.title
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(1, reservesSpace: true)
                .bold()
        }.padding(12)
            .padding(.horizontal)
            .background(currentAppTheme.surface.normal)
            .clipShape(.rect(cornerRadius: 8))
            .hoverEffect()
    }
}

#Preview {
    Features.addFeatures(features: [])
    return VStack {
        HStack {
            Label("Test Label", systemImage: "folder").labelStyle(.lbPill)
            Label(title: {
                Text("Test Label")
            }, icon: {
                Image(uiImage: UIImage.add)
            }).labelStyle(.lbPill)
        }
        Label("Test Label", systemImage: "folder").labelStyle(.lbPill)
        Label("Test Label", systemImage: "circle").labelStyle(.lbPill)
        Label("Test Label", systemImage: "doc").labelStyle(.lbPill)
            .foregroundStyle(.blue)
    }
}
