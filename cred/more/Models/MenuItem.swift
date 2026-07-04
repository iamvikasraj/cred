//
//  MenuItem.swift
//  cred
//
//  Data model for menu items in the More view
//

import SwiftUI

struct MenuItem: Identifiable {
    /// Stable identity so ForEach diffing and animations work across renders.
    /// Titles are unique within any single row/grid this app renders.
    var id: String { title }
    let icon: MenuIcon
    let title: String
    let titleLines: [String]
    let subtitle: String?
    let iconAssetName: String?
    let iconWidth: CGFloat?
    let iconHeight: CGFloat?
    let action: (@MainActor () -> Void)?

    enum MenuIcon {
        case sfSymbol(String)
        case image(String)
        case system(String)

        @ViewBuilder
        var view: some View {
            switch self {
            case .sfSymbol(let name):
                Image(systemName: name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .image(let name):
                Image(name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .system(let name):
                Image(systemName: name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }

    init(
        icon: MenuIcon = .image(""),
        title: String,
        titleLines: [String]? = nil,
        subtitle: String? = nil,
        iconAssetName: String? = nil,
        iconWidth: CGFloat? = nil,
        iconHeight: CGFloat? = nil,
        action: (@MainActor () -> Void)? = nil
    ) {
        self.icon = icon
        self.title = title
        self.titleLines = titleLines ?? [title]
        self.subtitle = subtitle
        self.iconAssetName = iconAssetName
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
        self.action = action
    }
}
