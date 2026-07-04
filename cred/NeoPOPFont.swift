import SwiftUI
import UIKit

/// NeoPOP typography: **BR Firma** (sans) and **Cirka** (serif headings).
/// Font files live under `Resources/Fonts/` and are listed in `CredFonts.plist` → UIAppFonts.
/// If a file is missing, `Font.custom` falls back to a system font at runtime.
enum NeoPOPFont {

    enum Family {
        case firma
        case cirka
    }

    static func firma(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        font(family: .firma, size: size, weight: weight)
    }

    @available(*, deprecated, renamed: "firma")
    static func gilroy(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        firma(size: size, weight: weight)
    }

    static func cirka(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        font(family: .cirka, size: size, weight: weight)
    }

    static func uiFont(family: Family = .firma, size: CGFloat, weight: Font.Weight = .regular) -> UIFont {
        UIFont(name: postScriptName(family: family, weight: weight), size: size)
            ?? .systemFont(ofSize: size)
    }

    private static func font(family: Family, size: CGFloat, weight: Font.Weight) -> Font {
        let name = postScriptName(family: family, weight: weight)
        return Font.custom(name, size: size, relativeTo: textStyle(for: size))
    }

    /// Maps a design size to the nearest system text style so Dynamic Type scaling applies.
    private static func textStyle(for size: CGFloat) -> Font.TextStyle {
        switch size {
        case ..<12: .caption2
        case ..<14: .footnote
        case ..<16: .subheadline
        case ..<18: .body
        case ..<21: .title3
        case ..<26: .title2
        case ..<32: .title
        default: .largeTitle
        }
    }

    /// Maps SwiftUI weight to per-file PostScript names (BR Firma / PP Cirka).
    private static func postScriptName(family: Family, weight: Font.Weight) -> String {
        switch family {
        case .firma:
            switch weight {
            case .ultraLight: return "BRFirma-ExtraLight"
            case .thin: return "BRFirma-Thin"
            case .light: return "BRFirma-Light"
            case .regular: return "BRFirma-Regular"
            case .medium: return "BRFirma-Medium"
            case .semibold: return "BRFirma-SemiBold"
            case .bold: return "BRFirma-Bold"
            case .heavy, .black: return "BRFirma-Black"
            default: return "BRFirma-Regular"
            }
        case .cirka:
            switch weight {
            case .bold, .heavy, .black: return "PPCirka-Bold"
            case .medium, .semibold: return "PPCirka-Medium"
            default: return "PPCirka-Regular"
            }
        }
    }
}
