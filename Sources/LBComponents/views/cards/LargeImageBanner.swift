//
//  SwiftUIView 2.swift
//
//
//  Created by Luis Alvarez on 5/20/24.
//

import SwiftUI
import LBFoundation

/// A view component that displays a large banner with an image, title, and subtitle.
/// This banner is typically used for prominent displays or featured content.
///
/// The banner consists of:
/// - A large image at the top
/// - A title below the image with customizable color
/// - A subtitle at the bottom
public struct LargeImageBanner: View {
    public let image: UIImage
    public let title: LocalizedStringKey
    public let subtitle: LocalizedStringKey
    public var titleColor: Color

    public init(image: UIImage, title: LocalizedStringKey, subtitle: LocalizedStringKey, titleColor: Color = currentAppTheme.primary) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.titleColor = titleColor
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .clipShape(.rect(cornerRadius: 20))
            Text(title)
                .font(.title2).bold()
                .foregroundStyle(titleColor).widthAligned()
            Text(subtitle).font(.footnote)
        }.padding()
    }
}

#Preview {
    Features.addFeatures(features: [])
    return ScrollView {
        LargeImageBanner(image: UIImage.add, title: "Get Premium", subtitle: "Read all of your files, and uncover new features")
    }
}
