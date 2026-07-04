//
//  AnalyticsView.swift
//  cred
//
//  Analytics view for navigation
//

import SwiftUI

struct AnalyticsView: View {
    @Environment(AppRouter.self) private var router
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Analytics")
                    .foregroundColor(.white)
                    .font(AppSansFont.font(size: 34, weight: .bold))
                    .padding()
                
                Text("Track your spending and insights")
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
        .navigationTitle("Analytics")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AnalyticsView()
            .environment(AppRouter())
    }
}

