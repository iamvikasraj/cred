import SwiftUI

/// [Figma 144:640](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=144-640)
struct HomePromoSection: View {
    let metrics: HomeMetrics

    private static let gradientAngleStart = UnitPoint(x: 0.12, y: 0.17)
    private static let gradientAngleEnd = UnitPoint(x: 0.88, y: 0.83)

    var body: some View {
        VStack(spacing: metrics.scaledContent(32)) {
            bannerCarousel

            VStack(spacing: metrics.scaledContent(20)) {
                promoText
                promoAction
            }
        }
    }

    // MARK: - Banner carousel

    private var bannerCarousel: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: metrics.scaledContent(32)) {
                bannerCard(
                    width: 202, height: 189,
                    cornerRadius: 12.928, innerMargin: 7.07, innerCornerRadius: 3.232,
                    from: Color(red: 177 / 255, green: 95 / 255, blue: 153 / 255),
                    to: Color(red: 242 / 255, green: 137 / 255, blue: 120 / 255)
                )
                bannerCard(
                    width: 250, height: 234,
                    cornerRadius: 16, innerMargin: 8.75, innerCornerRadius: 4,
                    from: Color(red: 0 / 255, green: 98 / 255, blue: 186 / 255),
                    to: Color(red: 12 / 255, green: 13 / 255, blue: 28 / 255)
                )
                bannerCard(
                    width: 202, height: 189,
                    cornerRadius: 12.928, innerMargin: 7.07, innerCornerRadius: 3.232,
                    from: Color(red: 161 / 255, green: 107 / 255, blue: 64 / 255),
                    to: Color(red: 97 / 255, green: 54 / 255, blue: 22 / 255)
                )
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .defaultScrollAnchor(.center)
    }

    private func bannerCard(
        width: CGFloat, height: CGFloat,
        cornerRadius: CGFloat, innerMargin: CGFloat, innerCornerRadius: CGFloat,
        from: Color, to: Color
    ) -> some View {
        let w = metrics.scaledContent(width)
        let h = metrics.scaledContent(height)
        let cr = metrics.scaledContent(cornerRadius)
        let im = metrics.scaledContent(innerMargin)
        let icr = metrics.scaledContent(innerCornerRadius)
        let border = Color(red: 237 / 255, green: 237 / 255, blue: 237 / 255)

        return RoundedRectangle(cornerRadius: cr, style: .continuous)
            .fill(Color.white)
            .overlay {
                RoundedRectangle(cornerRadius: cr, style: .continuous)
                    .strokeBorder(border, lineWidth: width < 210 ? 0.202 : 0.25)
            }
            .shadow(
                color: .black.opacity(0.08),
                radius: width < 210 ? 6.464 : 8,
                x: 0,
                y: width < 210 ? 6.464 : 8
            )
            .overlay {
                RoundedRectangle(cornerRadius: icr, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [from, to],
                            startPoint: Self.gradientAngleStart,
                            endPoint: Self.gradientAngleEnd
                        )
                    )
                    .padding(im)
            }
            .frame(width: w, height: h)
    }

    // MARK: - Promo text

    private var promoText: some View {
        VStack(spacing: metrics.scaledContent(7)) {
            Text("buy gold or silver.\nget 2% extra")
                .font(AppSansFont.font(size: 16, weight: .bold))
                .foregroundStyle(Color.black)
                .tracking(0.8)
                .multilineTextAlignment(.center)
                .lineSpacing(0)

            Text("live from 19-21 june")
                .font(AppSansFont.font(size: 10, weight: .medium))
                .foregroundStyle(Color(red: 61 / 255, green: 61 / 255, blue: 61 / 255))
                .tracking(0.5)
                .multilineTextAlignment(.center)
        }
        .frame(width: metrics.scaledContent(247))
    }

    // MARK: - Button + dots

    private var promoAction: some View {
        VStack(spacing: metrics.scaledContent(52)) {
            Button {} label: {
                Text("BUY NOW")
                    .font(AppSansFont.font(size: 10, weight: .medium))
                    .foregroundStyle(Color.white)
                    .tracking(0.5)
            }
            .padding(.horizontal, metrics.scaledContent(33))
            .padding(.vertical, metrics.scaledContent(11))
            .background(Color(red: 13 / 255, green: 13 / 255, blue: 13 / 255))
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .buttonStyle(.plain)

            HStack(spacing: metrics.scaledContent(3)) {
                ForEach(0..<5, id: \.self) { i in
                    Circle()
                        .fill(i == 2 ? Color.black : Color.black.opacity(0.2))
                        .frame(
                            width: metrics.scaledContent(4),
                            height: metrics.scaledContent(4)
                        )
                }
            }
        }
    }
}
