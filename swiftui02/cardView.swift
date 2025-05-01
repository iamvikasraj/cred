//
//  cardView.swift
//  swiftui02
//
//  Created by Vikas Raj Yadav on 29/04/25.
//

import SwiftUI

struct cardView: View {
    var body: some View {
        ZStack {
            // Black background for the entire view
            Color.black
                .ignoresSafeArea() // This ignores all safe areas
            
            GeometryReader { geometry in
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                           
                            
                            Spacer() // Pushes content up
                        }
                        .frame(minHeight: geometry.size.height - 22) // Ensure VStack fills ScrollView minus padding
                        .padding(.top, 60)
                        .frame(maxWidth: .infinity)
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                }
                .ignoresSafeArea(.container, edges: .all)
                .padding(.bottom, 11) // This specifically ignores the top safe area
            }
        }
    }
}

#Preview {
    MainView()
}
