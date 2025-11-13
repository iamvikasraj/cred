//
//  moreView.swift
//  cred
//
//  Created by Vikas Raj Yadav on 29/04/25.
//

import SwiftUI

struct more: View {
    @EnvironmentObject var router: AppRouter
    
    // Create menu data with router actions
    private var menuData: MenuDataWithRouter {
        MenuData.createItems(with: router)
    }
    
    var body: some View {
        ZStack {
            // Black background for the entire view
            Color.black
                .ignoresSafeArea() // This ignores all safe areas
            
            GeometryReader { geometry in
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .trailing, spacing: 52) {
                            
                                //top navigation section
                                HStack(alignment: .bottom) {
                                    VStack(alignment: .leading, spacing: 13) {
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                        }
                                        .padding(0)
                                        .frame(width: 61, height: 16, alignment: .topLeading)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                        }
                                        .padding(0)
                                        .frame(maxWidth: .infinity, minHeight: 26, maxHeight: 26, alignment: .topLeading)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    }
                                    .padding(0)
                                    .frame(width: 91, alignment: .topLeading)
                                    
                                    Spacer()
                                    
                                    HStack(alignment: .bottom, spacing: 10) {
                                        HStack(alignment: .center, spacing: 10) {
                                            
                                        }
                                        .padding(0)
                                        .frame(width: 40, height: 40, alignment: .leading)
                                        .background(.white)
                                        .cornerRadius(60)
                                        .overlay(
                                          RoundedRectangle(cornerRadius: 60)
                                            .inset(by: 0.25)
                                            .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 1)
                                        )
                                        
                                        HStack(alignment: .top, spacing: 10) {
                                            
                                        }
                                        .padding(10)
                                        .frame(width: 104, height: 41, alignment: .topLeading)
                                        .background(.white)
                                        .cornerRadius(60)
                                        .overlay(
                                          RoundedRectangle(cornerRadius: 60)
                                            .inset(by: 0.25)
                                            .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 1)
                                        )
                                    }
                                    .padding(0)
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                                
                                
                                // Popular section
                                VStack(alignment: .center, spacing: 60) {
                                    VStack(alignment: .leading, spacing: 20) {
                                        SectionHeader(title: "Popular")
                                        
                                        // First row of popular items with navigation
                                        MenuGrid(items: Array(menuData.popularItemsWithActions.prefix(4)))
                                        
                                        // Second row of popular items (if more than 4)
                                        if menuData.popularItemsWithActions.count > 4 {
                                            MenuGrid(items: Array(menuData.popularItemsWithActions.dropFirst(4).prefix(4)))
                                        }
                                    }
                                    .padding(0)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .top)
                                
                                // Banner design for the card
                                bannerview()
                                
                                // Finance section
                                VStack(alignment: .center, spacing: 60) {
                                    VStack(alignment: .leading, spacing: 20) {
                                        SectionHeader(title: "Money MAtters")
                                        
                                        MenuGrid(items: Array(menuData.financeItemsWithActions.prefix(4)))
                                    }
                                    .padding(0)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .top)
                                
                                VStack(alignment: .leading, spacing: 20) {
                                    SectionHeader(title: "Bills")
                                    
                                    MenuGrid(items: Array(menuData.settingsItemsWithActions.prefix(7)))
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 80)
                            
                            Spacer() // Pushes content up
                        }
                        .frame(minHeight: geometry.size.height - 22) // Ensure VStack fills ScrollView minus padding
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity)
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                }
                .ignoresSafeArea(.container, edges: .all)
                .padding(.bottom, 11) // This specifically ignores the top safe area
            }
        }
    }




#Preview {
    more()
        .environmentObject(AppRouter())
}

struct bannerview: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            
        }
        .padding(0)
        .frame(maxWidth: .infinity, minHeight: 85, maxHeight: 85, alignment: .leading)
        .background(.gray)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.25)
                .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
        )
    }
}


