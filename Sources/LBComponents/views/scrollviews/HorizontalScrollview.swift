//
//  HorizontalScrollview.swift
//
//
//  Created by Luis Alvarez on 12/26/23.
//

import LBFoundation
import SwiftUI

public struct HorizontalScrollview<Content>: View where Content: View {
    public let spacing: CGFloat
    public let initialSpacing: CGFloat
    @ViewBuilder public var content: () -> Content

    public init(spacing: CGFloat = 16, initialSpacing: CGFloat = 0, @ViewBuilder _ content: @escaping () -> Content) {
        self.spacing = spacing
        self.initialSpacing = initialSpacing
        self.content = content
    }

    public init(@ViewBuilder _ content: @escaping () -> Content) {
        spacing = 16
        initialSpacing = 0
        self.content = content
    }

    public var body: some View {
        ScrollView(.horizontal, content: {
            HStack(spacing: spacing, content: {
                if initialSpacing > 0 {
                    Spacer().frame(maxWidth: initialSpacing)
                }
                content()
            })
        }).scrollIndicators(.never)
    }
}

#Preview {
    Features.addFeatures(features: [])
    return VStack {
        HorizontalScrollview(spacing: 32) {
            var button = Button("Button with Style", systemImage: "doc", action: {})

            button.buttonStyle(.lbPill)
            button.buttonStyle(.lbPrimary)
            button.buttonStyle(.lbSecondary)
            button.buttonStyle(.lbVerticalBorder)
        }
    }
}
