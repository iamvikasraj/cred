//
//  HelpView.swift
//  cred
//
//  Help view for navigation
//

import SwiftUI

struct HelpView: View {
    @Environment(AppRouter.self) private var router
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Help & Support")
                    .foregroundColor(.white)
                    .font(AppSansFont.font(size: 34, weight: .bold))
                    .padding()
                
                Text("Get help and contact support")
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
        .navigationTitle("Help & Support")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        HelpView()
            .environment(AppRouter())
    }
}

