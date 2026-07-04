import SwiftUI

/// [Figma 144:420](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=144-420)
struct HomeExploreChip: View {
    enum Variant {
        case garage
        case shop
        case refer
        case cash
        case cibilScore
        case muted
    }

    struct Metrics {
        let height: CGFloat
        let dotSize: CGFloat
        let garagePlaceholderSize: CGFloat
        let cibilIconSize: CGFloat
        let paddingHorizontal: CGFloat
        let paddingLeading: CGFloat
        let paddingTrailing: CGFloat
        let paddingVertical: CGFloat
        let contentSpacing: CGFloat
        let garageWidth: CGFloat
        let cashWidth: CGFloat
    }

    let title: String
    let variant: Variant
    let metrics: Metrics

    private let border = Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
    private let dotGradient = LinearGradient(
        colors: [
            Color(red: 215 / 255, green: 222 / 255, blue: 255 / 255),
            Color(red: 241 / 255, green: 248 / 255, blue: 254 / 255),
        ],
        startPoint: .top,
        endPoint: .bottom
    )

    var body: some View {
        chipContent
            .padding(.leading, metrics.paddingLeading)
            .padding(.trailing, metrics.paddingTrailing)
            .padding(.vertical, metrics.paddingVertical)
            .frame(height: metrics.height)
            .background { chipBackground }
            .modifier(ChipWidthModifier(width: fixedWidth))
    }

    @ViewBuilder
    private var chipContent: some View {
        HStack(spacing: metrics.contentSpacing) {
            if variant == .garage {
                chipLabel
                Spacer(minLength: 0)
                Circle()
                    .strokeBorder(border, lineWidth: 1)
                    .background(Circle().fill(Color.white))
                    .frame(width: metrics.garagePlaceholderSize, height: metrics.garagePlaceholderSize)
            } else if variant == .cibilScore {
                Image("home_explore_cibil_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: metrics.cibilIconSize, height: metrics.cibilIconSize)
                chipLabel
            } else {
                Circle()
                    .fill(dotGradient)
                    .frame(width: metrics.dotSize, height: metrics.dotSize)
                chipLabel
            }
        }
    }

    private var chipLabel: some View {
        Text(title)
            .font(AppSansFont.font(size: 11, weight: .bold))
            .foregroundStyle(Color.black)
            .tracking(0.55)
            .lineLimit(1)
    }

    private var fixedWidth: CGFloat? {
        switch variant {
        case .garage: metrics.garageWidth
        case .cash: metrics.cashWidth
        default: nil
        }
    }

    @ViewBuilder
    private var chipBackground: some View {
        switch variant {
        case .garage:
            Capsule(style: .continuous)
                .fill(Color.white)
                .overlay { Capsule(style: .continuous).strokeBorder(border, lineWidth: 1) }
                .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 8)
        case .shop:
            chipCapsule(fill: AnyShapeStyle(Color.white))
        case .refer:
            chipCapsule(
                fill: AnyShapeStyle(
                    LinearGradient(
                        stops: [
                            .init(color: .white, location: 0.2222),
                            .init(color: Color(red: 233 / 255, green: 237 / 255, blue: 255 / 255), location: 0.6889),
                            .init(color: Color(red: 202 / 255, green: 211 / 255, blue: 255 / 255), location: 1.0),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            )
        case .cash:
            chipCapsule(
                fill: AnyShapeStyle(
                    LinearGradient(
                        stops: [
                            .init(color: Color(red: 254 / 255, green: 254 / 255, blue: 254 / 255), location: 0.2222),
                            .init(color: Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255), location: 1.0),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            )
        case .cibilScore:
            chipCapsule(fill: AnyShapeStyle(Color.white))
        case .muted:
            chipCapsule(
                fill: AnyShapeStyle(
                    LinearGradient(
                        colors: [
                            Color(red: 253 / 255, green: 253 / 255, blue: 253 / 255),
                            Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            )
        }
    }

    private func chipCapsule(fill: AnyShapeStyle) -> some View {
        Capsule(style: .continuous)
            .fill(fill)
            .overlay { Capsule(style: .continuous).strokeBorder(border, lineWidth: 1) }
    }
}

private struct ChipWidthModifier: ViewModifier {
    let width: CGFloat?

    func body(content: Content) -> some View {
        if let width {
            content.frame(width: width)
        } else {
            content.fixedSize(horizontal: true, vertical: false)
        }
    }
}
