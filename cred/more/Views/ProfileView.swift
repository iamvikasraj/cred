//
//  ProfileView.swift
//  cred
//
//  Profile view for navigation
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Profile")
                    .foregroundColor(.white)
                    .font(AppSansFont.font(size: 34, weight: .bold))
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
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ProfileView()
            .environmentObject(AppRouter())
    }
}

