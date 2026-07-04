import SwiftUI

struct HomeSectionLabel: View {
    let text: String
    var tracking: CGFloat = 0.66

    var body: some View {
        Text(text)
            .font(AppSansFont.font(size: 11, weight: .semibold))
            .foregroundStyle(Color(red: 133 / 255, green: 133 / 255, blue: 133 / 255))
            .tracking(tracking)
            .textCase(.uppercase)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
