import SwiftUI

struct HomePillChip: View {
    struct Metrics {
        let iconSize: CGFloat
        let chevronSize: CGFloat
        let spacing: CGFloat
        let paddingLeading: CGFloat
        let paddingTrailing: CGFloat
        let paddingVertical: CGFloat
    }

    let title: String
    let subtitle: String?
    let metrics: Metrics

    private let subtitleColor = Color(red: 143 / 255, green: 143 / 255, blue: 143 / 255)
    private let borderColor = Color(red: 198 / 255, green: 199 / 255, blue: 199 / 255)
    private let iconFill = Color(red: 209 / 255, green: 210 / 255, blue: 210 / 255)

    var body: some View {
        HStack(alignment: .center, spacing: metrics.spacing) {
            RoundedRectangle(cornerRadius: 2, style: .continuous)
                .fill(iconFill)
                .frame(width: metrics.iconSize, height: metrics.iconSize)

            HStack(alignment: .center, spacing: metrics.spacing) {
                Text(title)
                    .font(AppSansFont.font(size: 11, weight: .semibold))
                    .foregroundStyle(Color.black)
                    .tracking(0.55)
                    .lineLimit(1)

                if let subtitle {
                    Text(subtitle)
                        .font(AppSansFont.font(size: 12, weight: .semibold))
                        .foregroundStyle(subtitleColor)
                        .tracking(0.36)
                        .lineLimit(1)

                    Image("home_pill_chevron")
                        .resizable()
                        .scaledToFit()
                        .frame(width: metrics.chevronSize, height: metrics.chevronSize)
                }
            }
        }
        .padding(.leading, metrics.paddingLeading)
        .padding(.trailing, metrics.paddingTrailing)
        .padding(.vertical, metrics.paddingVertical)
        .background {
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
                        .strokeBorder(borderColor, lineWidth: 0.5)
                }
                .shadow(color: .black.opacity(0.08), radius: 0, x: 0, y: 2)
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

