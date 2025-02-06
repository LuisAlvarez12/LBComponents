//
//  CircularProgressView.swift
//  LBComponents
//
//  Created by Luis Alvarez on 2/5/25.
//

import LBFoundation
import SwiftUI

public struct CircularProgressView: View {
    public let progress: Double
    public var color: Color = .blue
    public var width: CGFloat = 20

    public init(progress: Double, color: Color, width: CGFloat) {
        self.progress = progress
        self.color = color
        self.width = width
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.4),
                    lineWidth: width
                )
            Circle()
                // 2
                .trim(from: 0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: width,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
        }
    }
}

#Preview {
    Features.addFeatures(features: [])
    return CircularProgressView(progress: 0.5, color: Color.red, width: 10).squareFrame(100)
}
