import SwiftUI

/// App sans-serif typography via a bundled custom font. Add your `.ttf`/`.otf` to the target and set
/// `Info.plist` → **Fonts provided by application** if needed. Adjust `postScriptName` to match **Font Book → PostScript name**.
enum AppSansFont {
    /// Default: Inter (same family name used in legacy screens). Replace when you ship your own file.
    private static let postScriptName = "Inter"

    static func font(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        Font.custom(postScriptName, size: size)
            .weight(weight)
    }
}
