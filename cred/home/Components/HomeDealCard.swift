import SwiftUI

/// [Figma 144:639](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=144-639)
struct HomeDealCard: View {
    let metrics: HomeMetrics

    var body: some View {
        RoundedRectangle(cornerRadius: metrics.scaledContent(16), style: .continuous)
            .fill(
                LinearGradient(
                    stops: [
                        .init(color: Color(red: 22 / 255, green: 22 / 255, blue: 22 / 255), location: 0),
                        .init(color: Color(red: 22 / 255, green: 22 / 255, blue: 22 / 255), location: 0.6),
                        .init(color: Color(red: 48 / 255, green: 40 / 255, blue: 7 / 255), location: 1),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(maxWidth: .infinity)
            .frame(height: metrics.scaledContent(150))
    }
}
