import SwiftUI

/// [Figma 144:635](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=144-635)
struct HomeUnlockedSection: View {
    let metrics: HomeMetrics

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.scaledContent(20)) {
            HomeSectionLabel(text: "UNLOCKED FOR YOU", tracking: 0.33)

            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: metrics.scaledContent(5), style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 129 / 255, green: 52 / 255, blue: 102 / 255),
                                Color(red: 94 / 255, green: 27 / 255, blue: 61 / 255),
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(maxWidth: .infinity)
                    .frame(height: metrics.scaledContent(140))

                Rectangle()
                    .fill(Color(red: 118 / 255, green: 41 / 255, blue: 88 / 255))
                    .frame(maxWidth: .infinity)
                    .frame(height: metrics.scaledContent(19))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
