//
//  MenuItemView.swift
//  cred
//
//  Reusable component for displaying menu items with icon and text
//

import SwiftUI

struct MenuItemView: View {
    let item: MenuItem
    
    var body: some View {
        Button(action: {
            item.action?()
        }) {
            VStack(alignment: .center, spacing: 11) {
                // Icon Circle
                ZStack {
                    item.icon.view
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                }
                .frame(width: 62, height: 62)
                .background(.white)
                .cornerRadius(60)
                .overlay(
                    RoundedRectangle(cornerRadius: 60)
                        .inset(by: 0.25)
                        .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 1)
                )
                
                // Text below icon
                VStack(alignment: .center, spacing: 3) {
                    Text(item.title)
                        .font(.system(size: 10, weight: .medium, design: .default))
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity)
                    
                    if let subtitle = item.subtitle {
                        Text(subtitle)
                            .font(.system(size: 8, weight: .regular, design: .default))
                            .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                            .lineLimit(1)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(width: 62, alignment: .center)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    HStack {
        MenuItemView(item: MenuItem(
            icon: .sfSymbol("creditcard.fill"),
            title: "Cards",
            subtitle: "Manage"
        ))
        
        MenuItemView(item: MenuItem(
            icon: .sfSymbol("gift.fill"),
            title: "Rewards",
            subtitle: nil
        ))
    }
    .padding()
}

