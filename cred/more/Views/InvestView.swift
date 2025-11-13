//
//  InvestView.swift
//  cred
//
//  Invest view for navigation
//

import SwiftUI

struct InvestView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Invest")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                
                Text("Investment options and portfolio")
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
        .navigationTitle("Invest")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        InvestView()
            .environmentObject(AppRouter())
    }
}

