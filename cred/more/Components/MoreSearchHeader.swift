import SwiftUI

/// [Figma 157:2082](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=157-2082)
struct MoreSearchHeader: View {
    let metrics: MoreMetrics

    private let suggestions = [
        "\"apply for credit card\"",
        "\"refer and earn\"",
        "\"self transfer\"",
    ]

    var body: some View {
        VStack(spacing: metrics.suggestionsTopGap) {
            HStack(spacing: metrics.searchChatGap) {
                searchBar
                    .frame(width: metrics.searchBarWidth)

                chatButton

                Spacer(minLength: 0)
            }
            .padding(.leading, metrics.searchRowLeadingInset)
            .frame(width: metrics.searchContentWidth, height: metrics.searchRowHeight, alignment: .leading)

            suggestionsCard
        }
        .frame(width: metrics.searchContentWidth)
    }

    private var searchBar: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: metrics.searchCornerRadius, style: .continuous)
                .strokeBorder(metrics.searchBorderColor, lineWidth: metrics.searchBorderWidth)

            HStack(spacing: 0) {
                Image("more_search")
                    .resizable()
                    .scaledToFit()
                    .frame(width: metrics.searchIconSize, height: metrics.searchIconSize)
                    .padding(.leading, metrics.searchIconLeading)

                Text("search")
                    .font(AppSansFont.font(size: metrics.scaled(12), weight: .semibold))
                    .foregroundStyle(Color(red: 102 / 255, green: 126 / 255, blue: 147 / 255))
                    .tracking(metrics.scaled(1.08))
                    .padding(.leading, metrics.scaled(8.5))

                Text("\"check credit score\"")
                    .font(AppSansFont.font(size: metrics.scaled(12), weight: .medium))
                    .foregroundStyle(Color(red: 148 / 255, green: 165 / 255, blue: 180 / 255))
                    .tracking(metrics.scaled(1.08))
                    .lineLimit(1)

                Spacer(minLength: 0)
            }
        }
        .frame(height: metrics.searchRowHeight)
    }

    private var chatButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: metrics.searchCornerRadius, style: .continuous)
                .strokeBorder(metrics.searchBorderColor, lineWidth: metrics.searchBorderWidth)

            Image("more_chat")
                .resizable()
                .scaledToFit()
                .frame(width: metrics.scaled(23), height: metrics.scaled(23.5))
        }
        .frame(width: metrics.searchChatSize, height: metrics.searchChatSize)
    }

    private var suggestionsCard: some View {
        VStack(spacing: 0) {
            HStack(spacing: metrics.suggestionsHeaderGap) {
                Rectangle()
                    .fill(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                    .frame(width: metrics.suggestionsBadgeSize, height: metrics.suggestionsBadgeSize)

                Text("TRY SEARCHING FOR")
                    .font(AppSansFont.font(size: metrics.scaled(10), weight: .regular))
                    .foregroundStyle(Color(red: 86 / 255, green: 86 / 255, blue: 86 / 255))
                    .tracking(metrics.scaled(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer(minLength: 0)
            }
            .padding(.leading, metrics.suggestionsHeaderLeading)
            .frame(height: metrics.suggestionsHeaderHeight, alignment: .center)

            Divider()
                .background(metrics.searchBorderColor)

            VStack(spacing: metrics.suggestionsRowGap) {
                ForEach(Array(suggestions.enumerated()), id: \.offset) { index, suggestion in
                    suggestionRow(suggestion)

                    if index < suggestions.count - 1 {
                        Divider()
                            .padding(.leading, metrics.scaled(30.5))
                            .background(metrics.searchBorderColor)
                    }
                }
            }
            .padding(.horizontal, metrics.suggestionsContentLeading)
            .padding(.vertical, metrics.scaled(14))
        }
        .overlay {
            RoundedRectangle(cornerRadius: metrics.suggestionsCornerRadius, style: .continuous)
                .strokeBorder(metrics.searchBorderColor, lineWidth: metrics.searchBorderWidth)
        }
    }

    private func suggestionRow(_ text: String) -> some View {
        HStack(spacing: metrics.suggestionsHeaderGap) {
            Image("more_search_small")
                .resizable()
                .scaledToFit()
                .frame(width: metrics.suggestionsRowIconSize, height: metrics.suggestionsRowIconSize)

            Text(text)
                .font(AppSansFont.font(size: metrics.scaled(11), weight: .bold))
                .foregroundStyle(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                .tracking(metrics.scaled(0.88))
                .frame(maxWidth: .infinity, alignment: .leading)

            Image("more_chevron")
                .resizable()
                .scaledToFit()
                .frame(width: metrics.suggestionsChevronSize, height: metrics.suggestionsChevronSize)
        }
    }
}
