//
//  PayBillsView.swift
//  cred
//
//  Pay Bills view for navigation
//

import SwiftUI

struct PayBillsView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Pay Bills")
                    .foregroundColor(.white)
                    .font(AppSansFont.font(size: 34, weight: .bold))
                    .padding()
                
                Text("Pay your bills and utilities")
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
        .navigationTitle("Pay Bills")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PayBillsView()
            .environmentObject(AppRouter())
    }
}

