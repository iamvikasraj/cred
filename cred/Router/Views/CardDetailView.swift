//
//  CardDetailView.swift
//  cred
//
//  Card detail view for navigation
//

import SwiftUI

struct CardDetailView: View {
    let cardId: String
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Card Detail")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Text("Card ID: \(cardId)")
                    .foregroundColor(.gray)
                    .padding()
                
                Button("Go Back") {
                    router.goBack()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CardDetailView(cardId: "123")
            .environmentObject(AppRouter())
    }
}

