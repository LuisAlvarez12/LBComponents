//
//  VerticalNoBorderButtonStyle.swift
//  LBComponents
//
//  Created by Luis Alvarez on 2/5/25.
//

import LBFoundation
import SwiftUI

public extension ButtonStyle where Self == VerticalNoBorderButtonStyle {
    static var lbVerticalNoBorder: VerticalNoBorderButtonStyle { .init() }
}

public struct VerticalNoBorderButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .labelStyle(.lbVerticalNoBorder)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    Features.addFeatures(features: [])
    return PreviewUtils.ButtonStyleDemo<VerticalNoBorderButtonStyle>(style: .lbVerticalNoBorder)
}
