import SwiftUI

// MARK: - Tokens

private enum HomeColors {
    static let sectionLabel = Color(red: 133 / 255, green: 133 / 255, blue: 133 / 255)
    static let pillSubtitle = Color(red: 143 / 255, green: 143 / 255, blue: 143 / 255)
    static let pillBorder = Color(red: 198 / 255, green: 199 / 255, blue: 199 / 255)
    static let pillIcon = Color(red: 209 / 255, green: 210 / 255, blue: 210 / 255)
    static let limitedTimeCard = Color(red: 0 / 255, green: 109 / 255, blue: 199 / 255)
    static let limitedTimeStrip = Color(red: 0 / 255, green: 142 / 255, blue: 239 / 255)
    static let forYouBorder = Color(red: 237 / 255, green: 237 / 255, blue: 237 / 255)
}

/// Sizes derived from the Figma reference frame (393pt wide) as ratios of the live container width.
private struct HomeMetrics {
    let containerWidth: CGFloat

    private static let referenceWidth: CGFloat = 393
    private static let referenceContentWidth: CGFloat = 343

    init(containerWidth: CGFloat) {
        self.containerWidth = max(containerWidth, 0)
    }

    private func scale(_ value: CGFloat, relativeTo reference: CGFloat = referenceWidth) -> CGFloat {
        guard reference > 0 else { return value }
        return containerWidth * (value / reference)
    }

    private func contentScale(_ value: CGFloat) -> CGFloat {
        scale(value, relativeTo: Self.referenceContentWidth)
    }

    func scaledContent(_ value: CGFloat) -> CGFloat {
        contentScale(value)
    }

    var horizontalInset: CGFloat { scale(25) }
    var contentWidth: CGFloat { containerWidth * (Self.referenceContentWidth / Self.referenceWidth) }

    /// Figma: profile at y=79 in frame 138:264.
    var profileTopOffset: CGFloat { scale(79) }
    var scrollBottomInset: CGFloat { scale(48) }

    /// Gaps between major sections (Figma: ~30pt).
    var sectionSpacing: CGFloat { scale(30) }
    var limitedTimeHeaderSpacing: CGFloat { contentScale(20) }
    var moneyMattersHeaderSpacing: CGFloat { contentScale(13) }
    var forYouHeaderSpacing: CGFloat { contentScale(20) }

    var profileSize: CGFloat { scale(47) }

    var limitedTimeCardHeight: CGFloat { contentScale(140) }
    var limitedTimeStripHeight: CGFloat { contentScale(19) }
    var limitedTimeCornerRadius: CGFloat { contentScale(5) }

    var pillChipSpacing: CGFloat { contentScale(8) }
    var pillIconSize: CGFloat { contentScale(16) }
    var pillChevronSize: CGFloat { contentScale(16) }
    var pillLeadingPadding: CGFloat { contentScale(12) }
    var pillTrailingPadding: CGFloat { contentScale(8) }
    var pillVerticalPadding: CGFloat { contentScale(10) }

    var forYouOuterCircle: CGFloat { contentScale(65) }
    var forYouCirclePadding: CGFloat { contentScale(5) }
    var forYouItemSpacing: CGFloat {
        let itemCount = CGFloat(4)
        let gaps = itemCount - 1
        let itemsWidth = forYouOuterCircle * itemCount
        let remaining = contentWidth - itemsWidth
        guard gaps > 0, remaining > 0 else { return contentScale(28) }
        return remaining / gaps
    }
    var forYouLabelSpacing: CGFloat { contentScale(9) }
    var forYouLabelLineHeight: CGFloat { contentScale(13) }
}

// MARK: - Profile

/// [Figma 138:64](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-264)
private struct HomeProfileButton: View {
    let metrics: HomeMetrics

    var body: some View {
        Button {
        } label: {
            Image("home_profile_avatar")
                .resizable()
                .scaledToFill()
                .frame(width: metrics.profileSize, height: metrics.profileSize)
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Limited Time Access

/// [Figma 138:267](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-267)
private struct LimitedTimeAccessSection: View {
    let metrics: HomeMetrics

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.limitedTimeHeaderSpacing) {
            Text("LIMITED TIME ACCESS")
                .font(AppSansFont.font(size: 11, weight: .semibold))
                .foregroundStyle(HomeColors.sectionLabel)
                .tracking(0.33)
                .textCase(.uppercase)
                .frame(maxWidth: .infinity, alignment: .leading)

            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: metrics.limitedTimeCornerRadius, style: .continuous)
                    .fill(HomeColors.limitedTimeCard)
                    .frame(maxWidth: .infinity)
                    .frame(height: metrics.limitedTimeCardHeight)

                RoundedRectangle(cornerRadius: 0, style: .continuous)
                    .fill(HomeColors.limitedTimeStrip)
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

private struct MoneyMatterPillBackground: View {
    var body: some View {
        Capsule(style: .continuous)
            .fill(
                LinearGradient(
                    colors: [
                        Color(red: 253 / 255, green: 253 / 255, blue: 253 / 255),
                        Color(red: 245 / 255, green: 246 / 255, blue: 246 / 255),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .overlay {
                Capsule(style: .continuous)
                    .strokeBorder(HomeColors.pillBorder, lineWidth: 0.5)
            }
            .shadow(color: .black.opacity(0.08), radius: 0, x: 0, y: 2)
    }
}

private struct MoneyMatterPillChip: View {
    let pill: MoneyMatterPill
    let metrics: HomeMetrics

    var body: some View {
        HStack(alignment: .center, spacing: metrics.pillChipSpacing) {
            RoundedRectangle(cornerRadius: 2, style: .continuous)
                .fill(HomeColors.pillIcon)
                .frame(width: metrics.pillIconSize, height: metrics.pillIconSize)

            HStack(alignment: .center, spacing: metrics.pillChipSpacing) {
                Text(pill.title)
                    .font(AppSansFont.font(size: 11, weight: .semibold))
                    .foregroundStyle(Color.black)
                    .tracking(0.55)
                    .lineLimit(1)

                if let subtitle = pill.subtitle {
                    Text(subtitle)
                        .font(AppSansFont.font(size: 12, weight: .semibold))
                        .foregroundStyle(HomeColors.pillSubtitle)
                        .tracking(0.36)
                        .lineLimit(1)

                    Image("home_pill_chevron")
                        .resizable()
                        .scaledToFit()
                        .frame(width: metrics.pillChevronSize, height: metrics.pillChevronSize)
                }
            }
        }
        .padding(.leading, metrics.pillLeadingPadding)
        .padding(.trailing, metrics.pillTrailingPadding)
        .padding(.vertical, metrics.pillVerticalPadding)
        .background { MoneyMatterPillBackground() }
        .fixedSize(horizontal: true, vertical: false)
    }
}

/// [Figma 138:109](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-109)
private struct MoneyMattersSection: View {
    let metrics: HomeMetrics

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.moneyMattersHeaderSpacing) {
            Text("MONEY MATTERS")
                .font(AppSansFont.font(size: 11, weight: .semibold))
                .foregroundStyle(HomeColors.sectionLabel)
                .tracking(0.66)
                .textCase(.uppercase)
                .padding(.horizontal, metrics.horizontalInset)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: metrics.pillChipSpacing) {
                    ForEach(moneyMatterPills) { pill in
                        MoneyMatterPillChip(pill: pill, metrics: metrics)
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
    ForYouItem(id: "bills", icon: "home_for_you_bills", titleLines: ["bills &", "recharges"]),
    // [Figma 138:157](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-157) · icon 138:178
    ForYouItem(id: "education", icon: "home_for_you_education", titleLines: ["education", "fees"], iconWidth: 25, iconHeight: 20.033),
    ForYouItem(id: "rewards", icon: "home_for_you_rewards", titleLines: ["rewards"], iconWidth: 23.187, iconHeight: 30),
]

/// [Figma 138:133](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-133) · circle [138:134](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-134)
private struct ForYouCircleIcon: View {
    let icon: String
    let metrics: HomeMetrics
    let iconWidth: CGFloat
    let iconHeight: CGFloat

    var body: some View {
        Circle()
            .fill(Color.white)
            .overlay {
                Circle()
                    .strokeBorder(HomeColors.forYouBorder, lineWidth: 0.25)
            }
            .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 8)
            .overlay {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255),
                                Color(red: 251 / 255, green: 251 / 255, blue: 251 / 255),
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .overlay {
                        Circle()
                            .strokeBorder(HomeColors.forYouBorder, lineWidth: 0.25)
                    }
                    .padding(metrics.forYouCirclePadding)
                    .overlay {
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: iconWidth, height: iconHeight)
                    }
            }
            .frame(width: metrics.forYouOuterCircle, height: metrics.forYouOuterCircle)
    }
}

private struct ForYouItemView: View {
    let item: ForYouItem
    let metrics: HomeMetrics

    private var iconWidth: CGFloat {
        metrics.scaledContent(item.iconWidth ?? 22.5)
    }

    private var iconHeight: CGFloat {
        metrics.scaledContent(item.iconHeight ?? 22)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.forYouLabelSpacing) {
            ForYouCircleIcon(
                icon: item.icon,
                metrics: metrics,
                iconWidth: iconWidth,
                iconHeight: iconHeight
            )

            VStack(alignment: .center, spacing: 0) {
                ForEach(Array(item.titleLines.enumerated()), id: \.offset) { _, line in
                    Text(line)
                        .font(AppSansFont.font(size: 10, weight: .semibold))
                        .foregroundStyle(Color.black)
                        .tracking(0.5)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .minimumScaleFactor(0.85)
                        .frame(maxWidth: .infinity)
                        .frame(height: metrics.forYouLabelLineHeight, alignment: .center)
                }
            }
            .frame(width: metrics.forYouOuterCircle)
        }
    }
}

/// [Figma 138:130](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=138-130)
private struct ForYouSection: View {
    let metrics: HomeMetrics

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.forYouHeaderSpacing) {
            Text("FOR YOU")
                .font(AppSansFont.font(size: 11, weight: .semibold))
                .foregroundStyle(HomeColors.sectionLabel)
                .tracking(0.66)
                .textCase(.uppercase)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(alignment: .top, spacing: metrics.forYouItemSpacing) {
                ForEach(forYouItems) { item in
                    ForYouItemView(item: item, metrics: metrics)
                }
            }
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
            HomeProfileButton(metrics: metrics)
                .padding(.horizontal, metrics.horizontalInset)

            LimitedTimeAccessSection(metrics: metrics)
                .padding(.horizontal, metrics.horizontalInset)

            MoneyMattersSection(metrics: metrics)

            ForYouSection(metrics: metrics)
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
        ZStack {
            Color.black
                .ignoresSafeArea()

            GeometryReader { geometry in
                let metrics = HomeMetrics(containerWidth: safeWidth(geometry.size.width))

                VStack(alignment: .center, spacing: 0) {
                    ScrollView(.vertical, showsIndicators: false) {
                        HomeScrollContent(metrics: metrics)
                    }
                    .frame(width: safeWidth(geometry.size.width))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.white)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
                .ignoresSafeArea(.container, edges: .all)
                .padding(.bottom, 12)
            }
        }
    }

    private func safeWidth(_ w: CGFloat) -> CGFloat {
        w.isFinite ? max(0, w) : 0
    }
}

#Preview {
    MainView()
}
