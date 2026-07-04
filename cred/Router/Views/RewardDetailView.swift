//
//  RewardDetailView.swift
//  cred
//
//  Reward detail view for navigation
//

import SwiftUI

struct RewardDetailView: View {
    let rewardId: String
    @Environment(AppRouter.self) private var router
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Reward Detail")
                    .foregroundColor(.white)
                    .font(AppSansFont.font(size: 34, weight: .bold))
                
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
        .navigationTitle("Reward Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        RewardDetailView(rewardId: "456")
            .environment(AppRouter())
    }
}

