import SwiftUI

// MARK: - Tokens

/// Sizes derived from the Figma reference frame (393pt wide) as ratios of the live container width.
struct HomeMetrics {
    let containerWidth: CGFloat

    private static let referenceWidth: CGFloat = 393
    private static let referenceContentWidth: CGFloat = 343

    /// Clamped so iPad/landscape widths don't scale into a blown-up phone layout.
    private static let maxScalingWidth: CGFloat = 430

    init(containerWidth: CGFloat) {
        self.containerWidth = min(max(containerWidth, 0), Self.maxScalingWidth)
    }

    private func scale(_ value: CGFloat, relativeTo reference: CGFloat = referenceWidth) -> CGFloat {
        guard reference > 0 else { return value }
        return containerWidth * (value / reference)
    }

    /// All Figma values are absolute pixel values in the 393pt reference frame.
    /// Scale everything uniformly against the frame width.
    func scaledContent(_ value: CGFloat) -> CGFloat {
        scale(value)
    }

    var horizontalInset: CGFloat { scale(25) }
    var contentWidth: CGFloat { containerWidth * (Self.referenceContentWidth / Self.referenceWidth) }

    /// Figma: header at y=75 in frame 138:264.
    var profileTopOffset: CGFloat { scale(75) }
    var scrollBottomInset: CGFloat { scale(48) }

    /// Gaps between major sections (Figma: ~30pt).
    var sectionSpacing: CGFloat { scale(30) }
    var limitedTimeHeaderSpacing: CGFloat { scale(20) }
    var moneyMattersHeaderSpacing: CGFloat { scale(13) }
    var forYouHeaderSpacing: CGFloat { scale(20) }

    var profileSize: CGFloat { scale(47) }

    var limitedTimeCardHeight: CGFloat { scale(140) }
    var limitedTimeStripHeight: CGFloat { scale(19) }
    var limitedTimeCornerRadius: CGFloat { scale(5) }

    var pillChipSpacing: CGFloat { scale(8) }
    var pillIconSize: CGFloat { scale(16) }
    var pillChevronSize: CGFloat { scale(15) }
    var pillLeadingPadding: CGFloat { scale(12) }
    var pillTrailingPadding: CGFloat { scale(8) }
    var pillVerticalPadding: CGFloat { scale(10) }

    var forYouOuterCircle: CGFloat { scale(65) }
    var forYouCirclePadding: CGFloat { scale(5) }
    var forYouItemSpacing: CGFloat {
        let itemCount = CGFloat(4)
        let gaps = itemCount - 1
        let itemsWidth = forYouOuterCircle * itemCount
        let remaining = contentWidth - itemsWidth
        guard gaps > 0, remaining > 0 else { return scale(28) }
        return remaining / gaps
    }
    var forYouLabelSpacing: CGFloat { scale(9) }
    var forYouLabelLineHeight: CGFloat { scale(13) }
}

// MARK: - Profile

// Header is now `HomeHeaderBar` (avatar + right icons) from Figma `145:822`.

// MARK: - Limited Time Access

/// [Figma 138:267](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-267)
private struct LimitedTimeAccessSection: View {
    let metrics: HomeMetrics

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.limitedTimeHeaderSpacing) {
            HomeSectionLabel(text: "LIMITED TIME ACCESS", tracking: 0.33)

            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: metrics.limitedTimeCornerRadius, style: .continuous)
                    .fill(Color(red: 0 / 255, green: 109 / 255, blue: 199 / 255))
                    .frame(maxWidth: .infinity)
                    .frame(height: metrics.limitedTimeCardHeight)

                RoundedRectangle(cornerRadius: 0, style: .continuous)
                    .fill(Color(red: 0 / 255, green: 142 / 255, blue: 239 / 255))
                    .frame(maxWidth: .infinity)
                    .frame(height: metrics.limitedTimeStripHeight)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Money Matters

private struct MoneyMatterPill: Identifiable {
    let id: String
    let title: String
    let subtitle: String?
}

private let moneyMatterPills: [MoneyMatterPill] = [
    MoneyMatterPill(id: "cash", title: "cash", subtitle: nil),
    MoneyMatterPill(id: "wallet", title: "wallet", subtitle: "add money"),
    MoneyMatterPill(id: "money", title: "money", subtitle: "add money"),
]

/// [Figma 138:109](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-109)
private struct MoneyMattersSection: View {
    let metrics: HomeMetrics

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.moneyMattersHeaderSpacing) {
            HomeSectionLabel(text: "MONEY MATTERS")
                .padding(.horizontal, metrics.horizontalInset)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: metrics.pillChipSpacing) {
                    ForEach(moneyMatterPills) { pill in
                        HomePillChip(
                            title: pill.title,
                            subtitle: pill.subtitle,
                            metrics: .init(
                                iconSize: metrics.pillIconSize,
                                chevronSize: metrics.pillChevronSize,
                                spacing: metrics.pillChipSpacing,
                                paddingLeading: metrics.pillLeadingPadding,
                                paddingTrailing: metrics.pillTrailingPadding,
                                paddingVertical: metrics.pillVerticalPadding
                            )
                        )
                    }
                }
                .padding(.leading, metrics.horizontalInset)
                .padding(.trailing, metrics.horizontalInset)
            }
            .scrollClipDisabled()
        }
    }
}

// MARK: - For You

private struct ForYouItem: Identifiable {
    let id: String
    let icon: String
    let titleLines: [String]
    let iconWidth: CGFloat?
    let iconHeight: CGFloat?

    init(
        id: String,
        icon: String,
        titleLines: [String],
        iconWidth: CGFloat? = nil,
        iconHeight: CGFloat? = nil
    ) {
        self.id = id
        self.icon = icon
        self.titleLines = titleLines
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
    }
}

private let forYouItems: [ForYouItem] = [
    ForYouItem(id: "pay-contacts", icon: "home_for_you_pay_contacts", titleLines: ["pay", "contacts"]),
    ForYouItem(id: "bills", icon: "home_for_you_bills", titleLines: ["bills &", "recharges"], iconWidth: 20, iconHeight: 22.5),
    // [Figma 138:157](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-157) · icon 138:178
    ForYouItem(id: "education", icon: "home_for_you_education", titleLines: ["education", "fees"], iconWidth: 25, iconHeight: 20.033),
    ForYouItem(id: "rewards", icon: "home_for_you_rewards", titleLines: ["rewards"], iconWidth: 23.187, iconHeight: 30),
]

/// [Figma 138:130](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-130)
private struct ForYouSection: View {
    let metrics: HomeMetrics

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.forYouHeaderSpacing) {
            HomeSectionLabel(text: "FOR YOU")

            HStack(alignment: .top, spacing: metrics.forYouItemSpacing) {
                ForEach(forYouItems) { item in
                    HomeForYouTile(
                        iconAssetName: item.icon,
                        labelLines: item.titleLines,
                        metrics: .init(
                            outerCircle: metrics.forYouOuterCircle,
                            innerPadding: metrics.forYouCirclePadding,
                            iconWidth: metrics.scaledContent(item.iconWidth ?? 22.5),
                            iconHeight: metrics.scaledContent(item.iconHeight ?? 22),
                            labelSpacing: metrics.forYouLabelSpacing,
                            labelLineHeight: metrics.forYouLabelLineHeight
                        )
                    )
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Quick Access

/// [Figma 145:672](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=145-672)
private struct QuickAccessSection: View {
    let metrics: HomeMetrics

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.scaledContent(22)) {
            HomeSectionLabel(text: "QUICK ACCESS", tracking: 0.33)

            VStack(alignment: .leading, spacing: metrics.scaledContent(10)) {
                HomeQuickAccessRow(icon: "home_qa_payment_history", title: "payment history", showDivider: true)
                HomeQuickAccessRow(icon: "home_qa_bank_accounts", title: "bank accounts", showDivider: true)
                HomeQuickAccessRow(icon: "home_qa_cibil", title: "CIBIL score", showDivider: true)
                HomeQuickAccessRow(icon: "home_qa_contact_support", title: "contact support", showDivider: true)
                HomeQuickAccessRow(icon: "home_qa_refer_earn", title: "refer and earn", showDivider: false)
            }
            .padding(.horizontal, -metrics.scaledContent(3.5))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Scroll Content

/// [Figma 138:264](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-264)
private struct HomeScrollContent: View {
    let metrics: HomeMetrics

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.sectionSpacing) {
            HomeHeaderBar(metrics: metrics)
                .padding(.horizontal, metrics.horizontalInset)

            LimitedTimeAccessSection(metrics: metrics)
                .padding(.horizontal, metrics.horizontalInset)

            MoneyMattersSection(metrics: metrics)

            ForYouSection(metrics: metrics)
                .padding(.leading, metrics.scaledContent(24))
                .padding(.trailing, metrics.horizontalInset)

            HomeExploreCredSection(metrics: metrics)
                .padding(.leading, metrics.scaledContent(24))
                .padding(.trailing, metrics.horizontalInset)

            HomeDealCard(metrics: metrics)
                .padding(.horizontal, metrics.horizontalInset)
                .padding(.top, metrics.scaledContent(68))

            HomeUnlockedSection(metrics: metrics)
                .padding(.horizontal, metrics.horizontalInset)

            HomePromoSection(metrics: metrics)
                .padding(.top, metrics.scaledContent(29))

            QuickAccessSection(metrics: metrics)
                .padding(.horizontal, metrics.horizontalInset)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, metrics.profileTopOffset)
        .padding(.bottom, metrics.scrollBottomInset)
    }
}

// MARK: - Home View

struct HomeView: View {
    var body: some View {
        TabScreenShell { width in
            HomeScrollContent(metrics: HomeMetrics(containerWidth: width))
        }
    }
}

#Preview {
    HomeView()
}
