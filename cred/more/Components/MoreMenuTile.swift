import SwiftUI

/// [Figma 159:2207](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=159-2207)
struct MoreMenuTile: View {
    private static let placeholderIcon = "more_education"
    private static let placeholderWidth: CGFloat = 25
    private static let placeholderHeight: CGFloat = 20.033

    let item: MenuItem
    let metrics: MoreMetrics
    var columnWidth: CGFloat?

    var body: some View {
        Button(action: { item.action?() }) {
            VStack(alignment: .center, spacing: metrics.menuLabelSpacing) {
                iconCircle

                Text(item.title)
                    .font(AppSansFont.font(size: metrics.scaled(10), weight: .medium))
                    .foregroundStyle(Color.black)
                    .tracking(metrics.scaled(0.5))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.85)
                    .frame(width: columnWidth ?? metrics.menuItemWidth)
                    .frame(minHeight: metrics.menuLabelLineHeight, alignment: .center)
            }
            .frame(width: columnWidth ?? metrics.menuItemWidth)
        }
        .buttonStyle(.plain)
    }

    /// [Figma 159:2208](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=159-2208)
    private var iconCircle: some View {
        let iconName = item.iconAssetName ?? Self.placeholderIcon
        let iconWidth = item.iconWidth ?? Self.placeholderWidth
        let iconHeight = item.iconHeight ?? Self.placeholderHeight

        return ZStack {
            Circle()
                .fill(Color.white)
                .overlay {
                    Circle()
                        .strokeBorder(metrics.menuBorderColor, lineWidth: 0.25)
                }

            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(
                    width: metrics.scaled(iconWidth),
                    height: metrics.scaled(iconHeight)
                )
        }
        .padding(metrics.menuCirclePadding)
        .frame(width: metrics.menuCircleSize, height: metrics.menuCircleSize)
    }
}
