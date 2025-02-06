//
//  PrimaryButtonStyle.swift
//  LBFoundation
//
//  Created by Luis Alvarez on 2/5/25.
//

import LBFoundation
import SwiftUI

public extension ButtonStyle where Self == PrimaryStyle {
    static var lbPrimary: PrimaryStyle { .init() }
}

public struct PrimaryStyle: ButtonStyle {
    var backgroundColor: Color

    public init(backgroundColor: Color = currentAppTheme.primary) {
        self.backgroundColor = backgroundColor
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(currentAppTheme.primary)
            .foregroundStyle(.white)
            .bold()
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    Features.addFeatures(features: [])
    return PreviewUtils.ButtonStyleDemo<PrimaryStyle>(style: .lbPrimary)
}
