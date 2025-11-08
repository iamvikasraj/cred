//
//  RewardDetailView.swift
//  cred
//
//  Reward detail view for navigation
//

import SwiftUI

struct RewardDetailView: View {
    let rewardId: String
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Reward Detail")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Text("Reward ID: \(rewardId)")
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
        RewardDetailView(rewardId: "456")
            .environmentObject(AppRouter())
    }
}

