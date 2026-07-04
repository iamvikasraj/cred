import SwiftUI

/// Common tab-screen chrome: black backdrop, rounded content sheet clipped
/// with square top corners, and a bottom inset that clears the tab bar.
/// Content receives the sanitized container width for metrics construction.
struct TabScreenShell<Content: View>: View {
    var background: Color = .white
    var showsIndicators = false
    @ViewBuilder let content: (CGFloat) -> Content

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            GeometryReader { geometry in
                let width = safeWidth(geometry.size.width)

                ScrollView(.vertical, showsIndicators: showsIndicators) {
                    content(width)
                }
                .frame(width: width)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(background)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 12,
                        bottomTrailingRadius: 12,
                        topTrailingRadius: 0,
                        style: .continuous
                    )
                )
                .ignoresSafeArea(.container, edges: .all)
                .padding(.bottom, 12)
            }
        }
    }

    private func safeWidth(_ width: CGFloat) -> CGFloat {
        width.isFinite ? max(0, width) : 0
    }
}
