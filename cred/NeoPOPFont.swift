import SwiftUI

/// NeoPOP typography: **Gilroy** (headings, body, caps) and **Cirka** (serif headings).
/// Font files live under `Resources/Fonts/` and are listed in `CredFonts.plist` → UIAppFonts.
/// If a file is missing, `Font.custom` falls back to a system font at runtime.
enum NeoPOPFont {

    enum Family {
        case gilroy
        case cirka
    }

    static func gilroy(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        font(family: .gilroy, size: size, weight: weight)
    }

    static func cirka(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        font(family: .cirka, size: size, weight: weight)
    }

    private static func font(family: Family, size: CGFloat, weight: Font.Weight) -> Font {
        let name = postScriptName(family: family, weight: weight)
        return Font.custom(name, size: size)
    }

    /// Maps SwiftUI weight to NeoPOP’s per-file names (matches CRED’s Gilroy / PPCirka set).
    private static func postScriptName(family: Family, weight: Font.Weight) -> String {
        switch family {
        case .gilroy:
            switch weight {
            case .ultraLight, .thin: return "Gilroy-Thin"
            case .light: return "Gilroy-Regular"
            case .regular: return "Gilroy-Regular"
            case .medium: return "Gilroy-Medium"
            case .semibold: return "Gilroy-SemiBold"
            case .bold: return "Gilroy-Bold"
            case .heavy, .black: return "Gilroy-ExtraBold"
            default: return "Gilroy-Regular"
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
