//
//  SpringsInModifier.swift
//
//
//  Created by Luis Alvarez on 9/14/23.
//

import LBFoundation
import SwiftUI

public extension View {
    func springsIn(offset: CGFloat = 40, duration: Double = 0.7) -> some View {
        modifier(SpringsIn(offSet: offset, duration: duration))
    }
}

struct SpringsIn: ViewModifier {
    var offSet: CGFloat
    var duration: Double
    @State var enabled = false

    func body(content: Content) -> some View {
        content
            .opacity(enabled ? 1.0 : 0.0)
            .transition(.opacity)
            .offset(y: enabled ? 0 : offSet)
            .rotationEffect(.degrees(enabled ? 0 : -40))
            .animation(.interpolatingSpring(mass: 1, stiffness: 170, damping: 8), value: enabled)
            .onAppear {
                print("animating in")
                withAnimation {
                    enabled = true
                }
            }
    }
}

#Preview {
    Features.addFeatures(features: [])
    return VStack {
        Button("Submit", systemImage: "folder", action: {})
            .buttonStyle(.lbPrimary)
            .springsIn()
    }
}
