//
//  LoansView.swift
//  cred
//
//  Loans view for navigation
//

import SwiftUI

struct LoansView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Loans")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                
                Text("Loan management and applications")
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
        .navigationTitle("Loans")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LoansView()
            .environmentObject(AppRouter())
    }
}

