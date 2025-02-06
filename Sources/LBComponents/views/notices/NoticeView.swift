//
//  NoticeView.swift
//  LBComponents
//
//  Created by Luis Alvarez on 2/5/25.
//

import Foundation
import LBFoundation
import SwiftUI

public struct ScreenNoticeView: View {
    public enum Style {
        case ImageLarge, Image, Circle, Inline
    }

    public let image: UIImage
    public let title: LocalizedStringKey
    public let message: LocalizedStringKey

    public var style: ScreenNoticeView.Style = .Image

    private let width: CGFloat = 320
    private let height: CGFloat = 100

    public var body: some View {
        VStack {
            switch style {
            case .ImageLarge:
                VStack {
                    imageView
                        .frame(maxWidth: width)
                        .frame(height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    titleView
                    bodyView
                }.clipShape(RoundedRectangle(cornerRadius: 12))
            case .Image:
                VStack {
                    imageView
                        .frame(maxWidth: width)
                        .frame(height: height)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    titleView
                    bodyView
                }.frame(maxWidth: width).clipShape(RoundedRectangle(cornerRadius: 12))
            case .Circle:
                VStack {
                    imageView
                        .squareFrame(height)
                        .clipShape(Circle())
                    titleView
                    bodyView
                }
            case .Inline:
                VStack {
                    ZStack(alignment: .bottomLeading) {
                        imageView
                            .frame(maxWidth: width)
                            .frame(height: 160)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay {
                                LinearGradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0.1), Color.black.opacity(0.001)], startPoint: .bottom, endPoint: .top)
                            }
                        Text(title)
                            .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .bold, design: .default))
                            .multilineTextAlignment(.leading)
                            .widthAligned()
                            .padding(8)
                    }

                    Text(message)
                        .foregroundStyle(Color.secondary)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.leading)
                        .widthAligned()
                }
            }
        }.frame(maxWidth: width)
    }

    var titleView: some View {
        Text(title)
            .font(.system(size: 18, weight: .bold))
            .widthAligned(.center)
            .foregroundStyle(currentAppTheme.text.primary)
            .multilineTextAlignment(.center)
    }

    var bodyView: some View {
        Text(message)
            .widthAligned(.center)
            .foregroundStyle(Color.secondary)
            .font(.system(size: 14, weight: .regular))
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .padding(.bottom)
    }

    var imageView: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .clipped()
    }
}

#Preview {
    Features.addFeatures(features: [])
    return VStack {
        ScreenNoticeView(image: .add, title: "No Files Found", message: "There is nothing here!", style: .Circle)
        ScreenNoticeView(image: .add, title: "No Files Found", message: "There is nothing here!", style: .Image)
        ScreenNoticeView(image: .add, title: "No Files Found", message: "There is nothing here!", style: .ImageLarge)
        ScreenNoticeView(image: .add, title: "No Files Found", message: "There is nothing here!", style: .Inline)
    }
}
