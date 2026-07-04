import SwiftUI
import UIKit

/// App sans via **BR Firma** (`NeoPOPFont.firma`).
enum AppSansFont {
    static let bodySize: CGFloat = 17

    static func font(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        NeoPOPFont.firma(size: size, weight: weight)
    }

    static func configureAppearance() {
        UINavigationBar.appearance().titleTextAttributes = [
            .font: NeoPOPFont.uiFont(size: 17, weight: .semibold),
        ]
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font: NeoPOPFont.uiFont(size: 34, weight: .bold),
        ]
    }
}
