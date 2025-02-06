//
//  PrimaryStyle.swift
//  LBComponents
//
//  Created by Luis Alvarez on 2/5/25.
//


import SwiftUI
import LBFoundation

public extension ButtonStyle where Self == SecondaryStyle {
    static var lbSecondary: SecondaryStyle { .init() }
}

public struct SecondaryStyle: ButtonStyle {
    
    var fontColor: Color
    var backgroundColor: Color
    
    public init(fontColor: Color = currentAppTheme.primary, backgroundColor: Color = currentAppTheme.surface.normal) {
        self.fontColor = fontColor
        self.backgroundColor = backgroundColor
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .bold()
            .foregroundStyle(fontColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    Features.addFeatures(features: [])
    return PreviewUtils.ButtonStyleDemo<SecondaryStyle>(style: .lbSecondary)
}
