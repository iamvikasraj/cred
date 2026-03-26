import SwiftUI

private struct MoneyMatterPill: Identifiable {
    let id: String
    let icon: String
    let title: String
    let subtitle: String
    let textCase: Text.Case?
}

private struct OptionalTextCase: ViewModifier {
    let textCase: Text.Case?

    func body(content: Content) -> some View {
        if let textCase {
            content.textCase(textCase)
        } else {
            content
        }
    }
}

private let moneyMatterPills: [MoneyMatterPill] = [
    MoneyMatterPill(id: "wallet", icon: "creditcard.fill", title: "wallet", subtitle: "add money", textCase: nil),
    MoneyMatterPill(id: "scan", icon: "qrcode.viewfinder", title: "scan", subtitle: "pay quick", textCase: .uppercase),
    MoneyMatterPill(id: "rewards", icon: "gift.fill", title: "Rewards", subtitle: "Earn pts", textCase: nil),
    MoneyMatterPill(id: "insights", icon: "chart.line.uptrend.xyaxis", title: "insights", subtitle: "see trends", textCase: .uppercase),
]

private struct MoneyMatterPillChip: View {
    let pill: MoneyMatterPill

    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Image(systemName: pill.icon)
                .font(.system(size: 14))
                .foregroundStyle(Color.primary)
                .frame(width: 16, height: 16)

            HStack(alignment: .center, spacing: 4) {
                Text(pill.title)
                    .font(AppSansFont.font(size: 11, weight: .semibold))
                    .foregroundStyle(Color.primary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)
                    .modifier(OptionalTextCase(textCase: pill.textCase))
                Text(pill.subtitle)
                    .font(AppSansFont.font(size: 10, weight: .regular))
                    .foregroundStyle(Color.secondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)
                    .modifier(OptionalTextCase(textCase: pill.textCase))
            }

            Image(systemName: "chevron.right")
                .font(.system(size: 9, weight: .semibold))
                .foregroundStyle(Color.blue)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .fixedSize(horizontal: true, vertical: false)
        .background {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.gray.opacity(0.15))
        }
    }
}

private struct MoneyMattersSection: View {
    private let horizontalInset: CGFloat = 24

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Money Matters")
                .font(AppSansFont.font(size: 12, weight: .medium))
                .foregroundColor(.gray)
                .textCase(.uppercase)
                .padding(.horizontal, horizontalInset)

            // Full-width scroll so chips aren’t squeezed by outer padding; inset lives on the row.
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 8) {
                    ForEach(moneyMatterPills) { pill in
                        MoneyMatterPillChip(pill: pill)
                    }
                }
                .padding(.horizontal, horizontalInset)
            }
        }
        .padding(.top, 24)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
    }
}

private struct UnlockedSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Unlocked for You")
                .font(AppSansFont.font(size: 12, weight: .medium))
                .foregroundColor(.gray)
                .textCase(.uppercase)

            RoundedRectangle(cornerRadius: 4)
                .fill(Color.blue)
                .frame(height: 160)
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
    }
}

private struct HomeTopBar: View {
    var body: some View {
        HStack {
            Button {
            } label: {
                Image("vry")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    }
                    .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 4)
            }
            .buttonStyle(.plain)

            Spacer()
            Color.clear
                .frame(width: 140, height: 40)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black)
                }

            Spacer()

            Button {
            } label: {
                Image("vry")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 24)
    }
}

private enum HomeLayout {
    /// Leading scroll inset below the status bar / notch; scrolls away with content.
    static let scrollTopInset: CGFloat = 24
}

private struct HomeScrollContent: View {
    var body: some View {
        VStack(spacing: 0) {
            HomeTopBar()

            UnlockedSection()

            MoneyMattersSection()
        }
        .padding(.top, HomeLayout.scrollTopInset)
    }
}

struct HomeView: View {
    var body: some View {
        ZStack {
            // Only the backdrop extends under the status bar; the card stays in the safe layout
            // so the top rounded corners aren’t clipped by the notch / status area.
            Color.black
                .ignoresSafeArea(edges: .all)

            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 0) {
                    ScrollView(.vertical, showsIndicators: false) {
                        HomeScrollContent()
                    }
                    .frame(width: safeWidth(geometry.size.width))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.white)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
                .padding(.bottom, 12)
            }
        }
    }

    private func safeWidth(_ w: CGFloat) -> CGFloat {
        w.isFinite ? max(0, w) : 0
    }
}

#Preview {
    MainView()
}
