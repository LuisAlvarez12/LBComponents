//
//  SwiftUIView.swift
//
//
//  Created by Luis Alvarez on 5/20/24.
//

import SwiftUI
import LBFoundation

/// A view component that displays a medium-sized banner with an image, title, and subtitle.
/// This banner is designed for compact presentations where a full-size banner would be too large.
///
/// The banner includes:
/// - A medium-sized image at the top
/// - A title with the app's primary text color
/// - A gray subtitle at the bottom
public struct MediumImageBanner: View {
    public let image: UIImage
    public let title: LocalizedStringKey
    public let subtitle: LocalizedStringKey

    public init(image: UIImage, title: LocalizedStringKey, subtitle: LocalizedStringKey) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 20))

            Text(title).font(.subheadline).bold().widthAligned()
                .foregroundStyle(currentAppTheme.text.primary)
                .multilineTextAlignment(.leading)
            Text(subtitle).foregroundStyle(Color.gray).font(.footnote).widthAligned()
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    Features.addFeatures(features: [])
    return VStack {
        HStack {
            Button(action: {}, label: {
                MediumImageBanner(image: UIImage.add, title: "Get Premium", subtitle: "Read all of your files, and uncover new features")
            })

            MediumImageBanner(image: UIImage.add, title: "Get Premium", subtitle: "Read all of your files, and uncover new features")
        }
    }
}
