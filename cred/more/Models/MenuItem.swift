//
//  MenuItem.swift
//  cred
//
//  Data model for menu items in the More view
//

import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID()
    let icon: MenuIcon
    let title: String
    let subtitle: String?
    let action: (() -> Void)?
    
    enum MenuIcon {
        case sfSymbol(String)  // SF Symbol name
        case image(String)      // Custom image name from Assets
        case system(String)     // System image name
        
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
    
    init(icon: MenuIcon, title: String, subtitle: String? = nil, action: (() -> Void)? = nil) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.action = action
    }
}

