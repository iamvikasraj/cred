//
//  BankingView.swift
//  cred
//
//  Banking view for navigation
//

import SwiftUI

struct BankingView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Banking")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                
                Text("Banking services and accounts")
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
        .navigationTitle("Banking")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        BankingView()
            .environmentObject(AppRouter())
    }
}

