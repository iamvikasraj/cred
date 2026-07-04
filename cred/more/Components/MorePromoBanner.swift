import SwiftUI

/// [Figma 157:2129](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=157-2129)
struct MorePromoBanner: View {
    let metrics: MoreMetrics

    var body: some View {
        RoundedRectangle(cornerRadius: metrics.promoBannerCornerRadius, style: .continuous)
            .fill(
                LinearGradient(
                    colors: [
                        Color(red: 23 / 255, green: 103 / 255, blue: 202 / 255),
                        Color(red: 72 / 255, green: 222 / 255, blue: 219 / 255),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: metrics.contentWidth)
            .frame(height: metrics.promoBannerHeight)
    }
}
