import SwiftUI

/// Sizes derived from the Figma reference frame (393pt wide) as ratios of the live container width.
/// [Figma 157:2081](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=157-2081)
struct MoreMetrics {
    let containerWidth: CGFloat

    private static let referenceWidth: CGFloat = 393
    private static let referenceSectionWidth: CGFloat = 344
    private static let referenceSearchAreaWidth: CGFloat = 361

    init(containerWidth: CGFloat) {
        self.containerWidth = max(containerWidth, 0)
    }

    private func scale(_ value: CGFloat, relativeTo reference: CGFloat = referenceWidth) -> CGFloat {
        guard reference > 0 else { return value }
        return containerWidth * (value / reference)
    }

    func scaled(_ value: CGFloat) -> CGFloat {
        scale(value)
    }

    var horizontalInset: CGFloat { scale(24) }
    var searchHorizontalInset: CGFloat { scale(16) }

    /// Figma inner section width (344pt at 393).
    var contentWidth: CGFloat { scale(Self.referenceSectionWidth) }

    /// Figma search block width (361pt at 393).
    var searchContentWidth: CGFloat { scale(Self.referenceSearchAreaWidth) }

    var searchRowLeadingInset: CGFloat { scale(8.5) }

    var topPadding: CGFloat { scale(74) }
    var scrollBottomInset: CGFloat { scale(48) }
    var sectionSpacing: CGFloat { scale(40) }
    var sectionHeaderSpacing: CGFloat { scale(20) }

    var searchRowHeight: CGFloat { scale(51) }
    var searchBarWidth: CGFloat { scale(282) }
    var searchChatGap: CGFloat { scale(12) }
    var searchChatSize: CGFloat { scale(50) }
    var searchCornerRadius: CGFloat { scale(28) }
    var searchBorderWidth: CGFloat { scale(1) }
    var searchIconSize: CGFloat { scale(14) }
    var searchIconLeading: CGFloat { scale(18.5) }
    var searchLabelLeading: CGFloat { scale(41) }
    var searchPlaceholderLeading: CGFloat { scale(90) }

    var suggestionsTopGap: CGFloat { scale(8) }
    var suggestionsCornerRadius: CGFloat { scale(16) }
    var suggestionsHeaderHeight: CGFloat { scale(35) }
    var suggestionsHeaderLeading: CGFloat { scale(15) }
    var suggestionsHeaderGap: CGFloat { scale(14) }
    var suggestionsBadgeSize: CGFloat { scale(15) }
    var suggestionsContentLeading: CGFloat { scale(15.5) }
    var suggestionsRowGap: CGFloat { scale(15) }
    var suggestionsRowIconSize: CGFloat { scale(14) }
    var suggestionsChevronSize: CGFloat { scale(19) }

    var promoBannerHeight: CGFloat { scale(87) }
    var promoBannerCornerRadius: CGFloat { scale(8) }

    var menuCircleSize: CGFloat { scale(60) }
    var menuCirclePadding: CGFloat { scale(5) }
    var menuItemWidth: CGFloat { scale(65) }
    var menuLabelSpacing: CGFloat { scale(9) }
    var menuLabelLineHeight: CGFloat { scale(13) }
    var menuRowSideInset: CGFloat { scale(6) }
    var menuGridReferenceGap: CGFloat { scale(28) }

    var menuBorderColor: Color {
        Color(red: 208 / 255, green: 208 / 255, blue: 208 / 255)
    }

    var searchBorderColor: Color {
        Color(red: 241 / 255, green: 241 / 255, blue: 241 / 255)
    }

    /// Adaptive gap for a row of `itemCount` tiles inside `contentWidth`, with optional side inset.
    func gridSpacing(itemCount: Int, itemWidth: CGFloat, sideInset: CGFloat = 0) -> CGFloat {
        let count = CGFloat(max(itemCount, 1))
        let gaps = max(count - 1, 1)
        let itemsWidth = itemWidth * count
        let available = contentWidth - (sideInset * 2) - itemsWidth
        guard available > 0 else { return menuGridReferenceGap }
        return available / gaps
    }

    /// Equal-width columns for flex rows (money matters, bills, etc.).
    func flexColumnWidth(columns: Int, sideInset: CGFloat = 0) -> CGFloat {
        let count = CGFloat(max(columns, 1))
        let totalInset = sideInset * 2
        let totalGaps = menuGridReferenceGap * max(count - 1, 0)
        let available = contentWidth - totalInset - totalGaps
        return max(available / count, 0)
    }
}
