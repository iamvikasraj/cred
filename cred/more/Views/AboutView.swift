//
//  AboutView.swift
//  cred
//
//  About view for navigation
//

import SwiftUI

struct AboutView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("About")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                
                Text("App version and information")
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
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AboutView()
            .environmentObject(AppRouter())
    }
}

