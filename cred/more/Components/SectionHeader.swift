//
//  SectionHeader.swift
//  cred
//
//  Reusable section header component
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(AppSansFont.font(size: 12, weight: .bold))
            .foregroundStyle(.gray)
            .textCase(.uppercase)
    }
}

#Preview {
    SectionHeader(title: "Popular")
        .padding()
}

