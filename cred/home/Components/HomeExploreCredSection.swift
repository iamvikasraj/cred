import SwiftUI

/// [Figma 144:420](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=144-420)
struct HomeExploreCredSection: View {
    let metrics: HomeMetrics

    private struct Chip: Identifiable {
        let id: String
        let title: String
        let variant: HomeExploreChip.Variant
    }

    private let rowOne: [Chip] = [
        Chip(id: "garage", title: "garage", variant: .garage),
        Chip(id: "shop", title: "shop", variant: .shop),
        Chip(id: "refer", title: "refer", variant: .refer),
    ]

    private let rowTwo: [Chip] = [
        Chip(id: "cash", title: "cash", variant: .cash),
        Chip(id: "cibil", title: "CIBIL score", variant: .cibilScore),
        Chip(id: "gift", title: "gift cards", variant: .muted),
    ]

    private let rowThree: [Chip] = [
        Chip(id: "gold", title: "gold", variant: .muted),
        Chip(id: "fd", title: "fixed deposit", variant: .muted),
    ]

    private var chipMetrics: HomeExploreChip.Metrics {
        .init(
            height: metrics.scaledContent(36),
            dotSize: metrics.scaledContent(17),
            garagePlaceholderSize: metrics.scaledContent(32),
            cibilIconSize: metrics.scaledContent(24),
            paddingHorizontal: metrics.scaledContent(17),
            paddingLeading: metrics.scaledContent(17),
            paddingTrailing: metrics.scaledContent(17),
            paddingVertical: metrics.scaledContent(9),
            contentSpacing: metrics.scaledContent(7),
            garageWidth: metrics.scaledContent(110),
            cashWidth: metrics.scaledContent(82)
        )
    }

    private var rowSpacing: CGFloat { metrics.scaledContent(10) }
    private var rowGap: CGFloat { metrics.scaledContent(16) }

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.scaledContent(20)) {
            header

            VStack(alignment: .leading, spacing: rowGap) {
                chipRow(rowOne)
                chipRow(rowTwo)
                chipRow(rowThree)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var header: some View {
        HStack(alignment: .center, spacing: metrics.scaledContent(4)) {
            HomeSectionLabel(text: "EXPLORE CRED", tracking: 0.33)

            Spacer(minLength: 0)

            HStack(spacing: metrics.scaledContent(2)) {
                Text("view all")
                    .font(AppSansFont.font(size: 11, weight: .regular))
                    .foregroundStyle(Color(red: 85 / 255, green: 85 / 255, blue: 85 / 255))
                    .tracking(0.22)

                Image("home_explore_chevron")
                    .resizable()
                    .scaledToFit()
                    .frame(width: metrics.scaledContent(10), height: metrics.scaledContent(10))
            }
        }
    }

    private func chipRow(_ chips: [Chip]) -> some View {
        HStack(alignment: .center, spacing: rowSpacing) {
            ForEach(chips) { chip in
                HomeExploreChip(
                    title: chip.title,
                    variant: chip.variant,
                    metrics: chipMetricsFor(chip)
                )
            }
        }
    }

    private func chipMetricsFor(_ chip: Chip) -> HomeExploreChip.Metrics {
        let m = chipMetrics
        switch chip.variant {
        case .garage:
            return HomeExploreChip.Metrics(
                height: metrics.scaledContent(36),
                dotSize: m.dotSize,
                garagePlaceholderSize: m.garagePlaceholderSize,
                cibilIconSize: m.cibilIconSize,
                paddingHorizontal: metrics.scaledContent(17),
                paddingLeading: metrics.scaledContent(17),
                paddingTrailing: metrics.scaledContent(17),
                paddingVertical: metrics.scaledContent(5),
                contentSpacing: m.contentSpacing,
                garageWidth: m.garageWidth,
                cashWidth: m.cashWidth
            )
        case .shop:
            return HomeExploreChip.Metrics(
                height: metrics.scaledContent(36),
                dotSize: m.dotSize,
                garagePlaceholderSize: m.garagePlaceholderSize,
                cibilIconSize: m.cibilIconSize,
                paddingHorizontal: metrics.scaledContent(17),
                paddingLeading: metrics.scaledContent(17),
                paddingTrailing: metrics.scaledContent(17),
                paddingVertical: metrics.scaledContent(9),
                contentSpacing: m.contentSpacing,
                garageWidth: m.garageWidth,
                cashWidth: m.cashWidth
            )
        case .refer:
            return HomeExploreChip.Metrics(
                height: metrics.scaledContent(36),
                dotSize: m.dotSize,
                garagePlaceholderSize: m.garagePlaceholderSize,
                cibilIconSize: m.cibilIconSize,
                paddingHorizontal: metrics.scaledContent(17),
                paddingLeading: metrics.scaledContent(17),
                paddingTrailing: metrics.scaledContent(17),
                paddingVertical: metrics.scaledContent(5),
                contentSpacing: m.contentSpacing,
                garageWidth: m.garageWidth,
                cashWidth: m.cashWidth
            )
        case .cash:
            return HomeExploreChip.Metrics(
                height: metrics.scaledContent(36),
                dotSize: m.dotSize,
                garagePlaceholderSize: m.garagePlaceholderSize,
                cibilIconSize: m.cibilIconSize,
                paddingHorizontal: metrics.scaledContent(16),
                paddingLeading: metrics.scaledContent(16),
                paddingTrailing: metrics.scaledContent(16),
                paddingVertical: metrics.scaledContent(9),
                contentSpacing: metrics.scaledContent(8),
                garageWidth: m.garageWidth,
                cashWidth: m.cashWidth
            )
        case .cibilScore:
            return HomeExploreChip.Metrics(
                height: metrics.scaledContent(35),
                dotSize: m.dotSize,
                garagePlaceholderSize: m.garagePlaceholderSize,
                cibilIconSize: m.cibilIconSize,
                paddingHorizontal: metrics.scaledContent(12),
                paddingLeading: metrics.scaledContent(6),
                paddingTrailing: metrics.scaledContent(12),
                paddingVertical: metrics.scaledContent(9),
                contentSpacing: metrics.scaledContent(8),
                garageWidth: m.garageWidth,
                cashWidth: m.cashWidth
            )
        case .muted:
            return HomeExploreChip.Metrics(
                height: metrics.scaledContent(36),
                dotSize: m.dotSize,
                garagePlaceholderSize: m.garagePlaceholderSize,
                cibilIconSize: m.cibilIconSize,
                paddingHorizontal: metrics.scaledContent(17),
                paddingLeading: metrics.scaledContent(17),
                paddingTrailing: metrics.scaledContent(17),
                paddingVertical: metrics.scaledContent(5),
                contentSpacing: m.contentSpacing,
                garageWidth: m.garageWidth,
                cashWidth: m.cashWidth
            )
        }
    }
}
