//
//  WalletView.swift
//  cred
//
//  Wallet view for navigation
//

import SwiftUI

struct WalletView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Wallet")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                
                Text("Manage your wallet and payments")
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
        .navigationTitle("Wallet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        WalletView()
            .environmentObject(AppRouter())
    }
}

