//
//  scanView.swift
//  cred
//
//  Created by Vikas Raj Yadav on 29/04/25.
//

import SwiftUI

struct scanView: View {
    var body: some View {
        ZStack {
            // Black background for the entire view
            Color.black
                .ignoresSafeArea() // This ignores all safe areas
            
            GeometryReader { geometry in
                VStack {
                    ZStack() {
                        
                        Rectangle()
                          .foregroundColor(.clear)
                          .frame(width: 30, height: 30)
                          .background(.black)
                          .overlay(
                            Rectangle()
                                .inset(by: 4)
                              .stroke(Color(red: 0.46, green: 0.46, blue: 0.46), lineWidth: 1)
                          )
                          .cornerRadius(24)
                          
                          .offset(x:148, y: -280)
                        
                        VStack(alignment: .center, spacing: 28) {
                            Image("vry")
                                .resizable()
                             .frame(width: 54, height: 54)
                             .aspectRatio(contentMode: .fill)
                             .background(.black)
                             .border(Color(red: 0.49, green: 0.49, blue: 0.49), width: 1)
                            
                            
                            VStack(alignment: .center, spacing: 10) {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 46, height: 13)
                                  .background(Color(red: 0.88, green: 0.88, blue: 0.88))
                                
                                HStack(alignment: .center, spacing: 6) {
                                    Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(width: 10, height: 10)
                                      .background(Color(red: 0.49, green: 0.49, blue: 0.49))
                                    Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(width: 141, height: 10)
                                      .background(Color(red: 0.49, green: 0.49, blue: 0.49))
                                    Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(width: 10, height: 10)
                                      .background(Color(red: 0.49, green: 0.49, blue: 0.49))
                                }
                                .padding(0)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .top)
                            
                            VStack(alignment: .center, spacing: 10) {
                                HStack(alignment: .center, spacing: 21) {
                                    ZStack {
                                        
                                    }
                                    .frame(width: 20, height: 20)
                                    .background(Color(red: 0.24, green: 0.24, blue: 0.24))
                                    
                                    ZStack {
                                        
                                    }
                                    .frame(width: 20, height: 20)
                                    .background(Color(red: 0.24, green: 0.24, blue: 0.24))
                                    
                                    ZStack {
                                        
                                    }
                                    .frame(width: 20, height: 20)
                                    .background(Color(red: 0.24, green: 0.24, blue: 0.24))
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.horizontal, 80)
                            .padding(.vertical, 20)
                            .frame(width: 262, height: 262, alignment: .bottom)
                            .overlay(
                              Rectangle()
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.46, green: 0.46, blue: 0.46), lineWidth: 1)
                            )
                            
                            VStack(alignment: .leading, spacing: 30) {
                                VStack(alignment: .center, spacing: 13) {
                                    Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(width: 45, height: 45)
                                      .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(maxWidth: .infinity, minHeight: 23, maxHeight: 23)
                                      .background(Color(red: 0.24, green: 0.24, blue: 0.24))
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .top)
                                
                                VStack(alignment: .center, spacing: 18) {
                                    ZStack {
                                        
                                    }
                                    .frame(maxWidth: .infinity, minHeight: 41, maxHeight: 41)
                                    .background(.black)
                                    .cornerRadius(60)
                                    .overlay(
                                      RoundedRectangle(cornerRadius: 60)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.35, green: 0.35, blue: 0.35), lineWidth: 1)
                                    )
                                    
                                    Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(width: 99, height: 12)
                                      .background(Color(red: 0.24, green: 0.24, blue: 0.24))
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .top)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(54)

                        .frame(minHeight: geometry.size.height - 22) // Ensure VStack fills ScrollView minus padding
                        .padding(.top, 60)
                        .frame(maxWidth: .infinity)
                    }

                    .cornerRadius(20)
                }
                .ignoresSafeArea(.container, edges: .all)
                .padding(.bottom, 11) // This specifically ignores the top safe area
            }
        }
    }
}

#Preview {
    scanView()
}
