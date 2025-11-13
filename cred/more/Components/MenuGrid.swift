//
//  MenuGrid.swift
//  cred
//
//  Grid component that displays 4 menu items in a row
//

import SwiftUI

struct MenuGrid: View {
    let items: [MenuItem]
    
    var body: some View {
        HStack(alignment: .center) {
            ForEach(items.prefix(4)) { item in
                MenuItemView(item: item)
                
                if item.id != items.prefix(4).last?.id {
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    MenuGrid(items: MenuData.popularItems)
        .padding()
}

