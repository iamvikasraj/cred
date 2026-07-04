import SwiftUI

struct HomeForYouTile: View {
    struct Metrics {
        let outerCircle: CGFloat
        let innerPadding: CGFloat
        let iconWidth: CGFloat
        let iconHeight: CGFloat
        let labelSpacing: CGFloat
        let labelLineHeight: CGFloat
    }

    let iconAssetName: String
    let labelLines: [String]
    let metrics: Metrics

    private let border = Color(red: 237 / 255, green: 237 / 255, blue: 237 / 255)

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.labelSpacing) {
            Circle()
                .fill(Color.white)
                .overlay { Circle().strokeBorder(border, lineWidth: 0.25) }
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
                        .overlay { Circle().strokeBorder(border, lineWidth: 0.25) }
                        .padding(metrics.innerPadding)
                        .overlay {
                            Image(iconAssetName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: metrics.iconWidth, height: metrics.iconHeight)
                        }
                }
                .frame(width: metrics.outerCircle, height: metrics.outerCircle)

            VStack(alignment: .center, spacing: 0) {
                ForEach(Array(labelLines.enumerated()), id: \.offset) { _, line in
                    Text(line)
                        .font(AppSansFont.font(size: 10, weight: .medium))
                        .foregroundStyle(Color.black)
                        .tracking(0.5)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .minimumScaleFactor(0.85)
                        .frame(maxWidth: .infinity)
                        .frame(height: metrics.labelLineHeight, alignment: .center)
                }
            }
            .frame(width: metrics.outerCircle)
        }
    }
}

