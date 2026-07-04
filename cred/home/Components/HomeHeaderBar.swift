import SwiftUI

/// [Figma 145:822](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=145-822)
struct HomeHeaderBar: View {
    let metrics: HomeMetrics

    var body: some View {
        HStack(alignment: .center) {
            Button {} label: {
                Image("home_profile_avatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: metrics.profileSize, height: metrics.profileSize)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)

            Spacer()

            HStack(spacing: metrics.scaledContent(20)) {
                Button {} label: {
                    Image("home_header_search")
                        .resizable()
                        .scaledToFit()
                        .frame(width: metrics.scaledContent(23), height: metrics.scaledContent(23))
                }
                .buttonStyle(.plain)

                Button {} label: {
                    Image("home_header_bell")
                        .resizable()
                        .scaledToFit()
                        .frame(width: metrics.scaledContent(24), height: metrics.scaledContent(24))
                }
                .buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
