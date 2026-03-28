import SwiftUI

/// Temporary **SF Rounded** everywhere `AppSansFont` is used. Swap implementation later (e.g. Gilroy via `NeoPOPFont`).
enum AppSansFont {
    static func font(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
}
