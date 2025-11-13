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
            .font(.caption)
            .fontWeight(.bold)
            .foregroundStyle(.gray)
            .textCase(.uppercase)
    }
}

#Preview {
    SectionHeader(title: "Popular")
        .padding()
}

