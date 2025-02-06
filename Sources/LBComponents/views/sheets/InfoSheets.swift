//
//  LBSheetModifier.swift
//  LBComponents
//
//  Created by Luis Alvarez on 2/5/25.
//


//
//  SwiftUIView.swift
//
//
//  Created by Luis Alvarez on 10/1/23.
//

import SwiftUI
import LBFoundation

public extension View {
    func infoSheet(isPresented: Binding<Bool>, title: LocalizedStringKey, desc: LocalizedStringKey? = nil, image: UIImage, buttonText: LocalizedStringKey = "OK") -> some View {
        modifier(LBSheetModifier(isPresented: isPresented, title: title, desc: desc, image: image, buttonText: buttonText))
    }
}

public extension View {
    @ViewBuilder
    func materialSheet() -> some View {
        self
            .padding()
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
            .presentationBackground(Material.thick)
            .presentationCornerRadius(30)
    }
}

public struct LBSheetModifier: ViewModifier {
    @Binding var isPresented: Bool

    let title: LocalizedStringKey
    let desc: LocalizedStringKey?
    let image: UIImage
    let buttonText: LocalizedStringKey

    public init(isPresented: Binding<Bool>, title: LocalizedStringKey, desc: LocalizedStringKey? = nil, image: UIImage, buttonText: LocalizedStringKey) {
        _isPresented = isPresented
        self.title = title
        self.desc = desc
        self.image = image
        self.buttonText = buttonText
    }

    public var sheet: some View {
        VStack {
            Spacer().frame(height: 42)
            Text(title)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .bold()

            if let desc {
                Text(desc)
                    .multilineTextAlignment(.center)
                    .padding(.top, 1)
                    .padding(.horizontal, 20)
            }

            Spacer()

            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 80)

            Spacer()
            Spacer()

            Button(buttonText, action: {
                isPresented = false
            }).buttonStyle(.lbPrimary)
        }

        .background(currentAppTheme.background)
        .presentationDetents([.medium])
    }

    public func body(content: Content) -> some View {
        content.sheet(isPresented: $isPresented, content: {
            sheet.presentationCornerRadius(80)
        })
    }
}

#Preview {
    Features.addFeatures(features: [])
    return Color.blue.infoSheet(isPresented: .constant(true), title: "Setup Folder Name", desc: "This is a sheet test", image: .add, buttonText: "Continue")
}
