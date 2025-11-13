//
//  AnalyticsView.swift
//  cred
//
//  Analytics view for navigation
//

import SwiftUI

struct AnalyticsView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Analytics")
                    .foregroundColor(.white)
                    .font(.largeTitle)
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
            .environmentObject(AppRouter())
    }
}

