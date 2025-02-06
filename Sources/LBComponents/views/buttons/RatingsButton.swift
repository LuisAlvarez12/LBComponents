//
//  RatingsButton.swift
//  LBComponents
//
//  Created by Luis Alvarez on 2/5/25.
//

import SwiftUI

public struct RatingButton<Content>: View where Content: View {
    @Environment(\.requestReview) var requestReview

    @ViewBuilder var content: () -> Content

    public init(_ content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        Button(action: {
            requestReview()
        }, label: {
            content()
        })
    }
}
