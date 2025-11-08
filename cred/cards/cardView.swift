//
//  cardView.swift
//  cred
//
//  Created by Vikas Raj Yadav on 29/04/25.
//

import SwiftUI

struct cardView: View {
    var body: some View {
        ZStack {
            // Black background for the entire view
            Color.black
                .ignoresSafeArea() // This ignores all safe areas
            
            GeometryReader { geometry in
                VStack {
                    VStack {
                        
                        
                        VStack(alignment: .center, spacing: 40) {
                            
                            // Back and right icons
                            HStack(alignment: .center) {
                                ZStack() {
                                    
                                }
                                .padding(10)
                                .frame(width: 64, height: 28, alignment: .topLeading)
                                .background(.white)
                                .cornerRadius(60)
                                .overlay(
                                  RoundedRectangle(cornerRadius: 60)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 1)
                                )
                                
                                Spacer()
                                
                                ZStack() {  }
                                .padding(10)
                                .frame(width: 28, height: 28, alignment: .topLeading)
                                .background(.white)
                                .cornerRadius(60)
                                .overlay(
                                  RoundedRectangle(cornerRadius: 60)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 1)
                                )
                                
                                ZStack() {  }
                                .padding(10)
                                .frame(width: 28, height: 28, alignment: .topLeading)
                                .background(.white)
                                .cornerRadius(60)
                                .overlay(
                                  RoundedRectangle(cornerRadius: 60)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 1)
                                )
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            // The middle layer
                            VStack(alignment: .center, spacing: 13) {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(maxWidth: 95, minHeight: 9, maxHeight: 9)
                                  .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(maxWidth: 95, minHeight: 20, maxHeight: 20)
                                  .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 161, height: 25)
                                  .background(Color(red: 0.05, green: 0.05, blue: 0.05))
                                  .cornerRadius(40)
                            }
                            .padding(0)
                            
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 65)
                        .zIndex(1)
                        .frame(maxWidth: .infinity, minHeight: 190, maxHeight: 190, alignment: .top)
                        
                        Divider().offset(y: 5)
                        
                        
                        ScrollView(.vertical, showsIndicators: false){
                            
                        VStack(spacing: 0) {
                           
                            // The top of the section
                            VStack(alignment: .center, spacing: 15) {
                                ZStack {
                                    
                                }
                                .frame(maxWidth: 315, minHeight: 183, maxHeight: 183)
                                .background(.white)
                                .cornerRadius(10)
                                .padding(.top, 46)
                                .shadow(color: .black.opacity(0.25), radius: 17, x: 0, y: 20)
                                
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 102, height: 24)
                                  .background(.white)
                                  .cornerRadius(60)
                                  .overlay(
                                    RoundedRectangle(cornerRadius: 60)
                                      .inset(by: 0.5)
                                      .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 1)
                                  )
                            }
                            .padding(0)
                            .frame(width: 315, alignment: .top)
                            
                            VStack(alignment: .leading, spacing: 30) {
                                
                                HStack(alignment: .center, spacing: 57) {
                                    
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 230, height: 9)
                                  .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(width: 27, height: 16)
                                      .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                                      .cornerRadius(30)
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.top, 46)
                            .frame(width: 315, alignment: .topLeading)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    Spacer(minLength: 40)
                                    cardDetails()
                                    cardDetails()
                                    cardDetails()
                                    cardDetails()
                                    Spacer(minLength: 40)
                                }
                             
                            }
                            .padding(.vertical, 40)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                            VStack(alignment: .leading, spacing: 36) {
                            Rectangle()
                              .foregroundColor(.clear)
                              .frame(width: 110, height: 9)
                              .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                
                                
                                VStack(spacing:20) {
                                    List()
                                    Divider()
                                    List()
                                    Divider()
                                    List()
                                    Divider()
                                    List()
                                    Divider()
                                    List()
                                    Spacer(minLength: 80)
                                }
                            }
                            .padding(0)
                            .frame(width: 316, alignment: .topLeading)
                            
                        }
                        
                        .frame(minHeight: geometry.size.height - 22) // Ensure VStack fills ScrollView minus padding
                        .padding(0)
                        .frame(maxWidth: .infinity)
                    }
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                }
                .ignoresSafeArea(.container, edges: .all)
                .padding(.bottom, 11) // This specifically ignores the top safe area
            }
        }
    }
}

#Preview {
    cardView()
}

struct cardDetails: View {
    let cardId: String = UUID().uuidString // You can pass actual card ID
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        Button(action: {
            router.navigate(to: .cardDetail(cardId: cardId))
        }) {
            HStack(alignment: .center, spacing: 10) {
                VStack(alignment: .leading, spacing: 21) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 40, height: 40)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity, minHeight: 10, maxHeight: 10)
                            .background(Color(red: 0.63, green: 0.63, blue: 0.63))
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 83, height: 10)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 83, height: 10)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 83, height: 10)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 41, height: 14)
                      .background(Color(red: 0, green: 0.3, blue: 0.81))
                    
                }
                .padding(0)
                .frame(width: 104, alignment: .topLeading)
            }
            .padding(20)
            .frame(width: 151, alignment: .leading)
            .background(.white)
            .overlay(
                Rectangle()
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct List: View {
    var body: some View {
        HStack(alignment: .center, spacing: 11) {
            HStack(alignment: .top, spacing: 10) {
                
            }
            .padding(10)
            .frame(width: 40, height: 40, alignment: .topLeading)
            .background(.white)
            .cornerRadius(60)
            .overlay(
                RoundedRectangle(cornerRadius: 60)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 1)
            )
            
            VStack(alignment: .leading, spacing: 13) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 111, height: 13)
                    .background(Color(red: 0.63, green: 0.63, blue: 0.63))
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity, minHeight: 13, maxHeight: 13)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            }
            .padding(0)
            .frame(width: 235, alignment: .topLeading)
            
            Image("next")
                .frame(width: 19.5, height: 7.5)
        }
        .padding(0)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
