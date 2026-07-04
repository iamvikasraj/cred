import SwiftUI

/// [Figma 145:678](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=145-678)
struct HomeQuickAccessRow: View {
    let icon: String
    let title: String
    let showDivider: Bool

    var body: some View {
        VStack(spacing: 13) {
            HStack(spacing: 4) {
                HStack(spacing: 17) {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)

                    Text(title)
                        .font(AppSansFont.font(size: 12, weight: .regular))
                        .foregroundStyle(Color(red: 13 / 255, green: 13 / 255, blue: 13 / 255))
                        .tracking(0.36)
                }
                .padding(.vertical, 4)

                Spacer()

                Image("home_qa_chevron")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
            }
            .frame(height: 30)

            if showDivider {
                Rectangle()
                    .fill(Color.black.opacity(0.10))
                    .frame(height: 0.5)
            }
        }
    }
}
