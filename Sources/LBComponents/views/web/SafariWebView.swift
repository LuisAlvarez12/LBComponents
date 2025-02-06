//
//  SafariWebView.swift
//  LBComponents
//
//  Created by Luis Alvarez on 2/5/25.
//

import SafariServices
import SwiftUI

public struct SafariWebView: UIViewControllerRepresentable {
    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public func makeUIViewController(context _: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    public func updateUIViewController(_: SFSafariViewController, context _: Context) {}
}
