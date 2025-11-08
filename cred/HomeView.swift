import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Black background for the entire view
            Color.black
            
            // Your home view content here
            GeometryReader { geometry in // Add GeometryReader here
                VStack(alignment: .center) {
                    
                    ZStack() {
                        Image("vry")
                            .resizable()
                            .frame(width: 40, height: 30)
                        
                        HStack(spacing: 10) {
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: 20, height: 20)
                                .cornerRadius(10)
                            
                            Text("Deals, rewards & more")
                              .font(Font.custom("Inter", size: 12))
                              .foregroundColor(.white)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                        .cornerRadius(24)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 60)
                    .padding(.bottom, 16)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.46, green: 1.0, blue: 0.0), location: 0.00),  // Neon green
                                Gradient.Stop(color: Color(red: 0.0, green: 0.7, blue: 1.0), location: 1.00),   // Bright blue
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        )
                    )
                    .cornerRadius(16)
                    
                    Rectangle().fill(Color.gray)
                        .frame(width: 21, height: 2)
                        .cornerRadius(5)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack() {
                            HStack(alignment: .center, spacing: 6) {
                                Rectangle()
                                    .frame(width: 13, height: 13)
                                    .overlay(
                                        Rectangle()
                                            .stroke(Color(red: 0.17, green: 0, blue: 0.14), lineWidth: 1)
                                    )
                                    .cornerRadius(24)
                                
                                Text("LIFETIME CASHBACK")
                                    .font(Font.custom("Inter", size: 8))
                                    .kerning(1.52)
                                    .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                                
                                Text("237")
                                    .font(
                                        Font.custom("Inter", size: 8)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(Color(red: 0.05, green: 0.05, blue: 0.05))
                            }
                            .padding(.top, 30)
                            
                            ZStack {
                                
                            }
                            .frame(width: 343, height: 200  )
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.top, 15)
                            .shadow(color: .black.opacity(0.25), radius: 17, x: 0, y: 20)
                            
                            HStack(alignment: .top, spacing: 20) {
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    Text("CRED CASH")
                                        .font(
                                            Font.custom("Inter", size: 8)
                                                .weight(.semibold)
                                        )
                                        .kerning(1.52)
                                        .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    
                                    Text("$15,216")
                                        .font(
                                            Font.custom("Inter", size: 12)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.05, green: 0.05, blue: 0.05))
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                                .padding(0)
                                
                                Rectangle()
                                    .foregroundStyle(Color(UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1)))
                                    .frame(width: 1, height: 40)
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    Text("CRED MONEY")
                                        .font(
                                            Font.custom("Inter", size: 8)
                                                .weight(.semibold)
                                        )
                                        .kerning(1.52)
                                        .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    
                                    Text("2 updates")
                                        .font(
                                            Font.custom("Inter", size: 12)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.05, green: 0.05, blue: 0.05))
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                                .padding(0)
                                
                                Rectangle()
                                    .foregroundStyle(Color(UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1)))
                                    .frame(width: 1, height: 40)
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    Text("CRED WALLET")
                                        .font(
                                            Font.custom("Inter", size: 8)
                                                .weight(.semibold)
                                        )
                                        .kerning(1.52)
                                        .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    
                                    Text("complete setup")
                                        .font(
                                            Font.custom("Inter", size: 12)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.05, green: 0.05, blue: 0.05))
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                                .padding(0)
                                
                                Rectangle()
                                    .foregroundStyle(Color(UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1)))
                                    .frame(width: 1, height: 40)
                                
                                
                            }
                            .padding(.top, 40)
                            .padding(.leading, 40)
                            
                            
                            Path { path in
                                path.move(to: CGPoint(x: 0, y: 0))
                                path.addLine(to: CGPoint(x: 347, y: 0))
                            }
                            .stroke(
                                Color(red: 0.86, green: 0.86, blue: 0.86),
                                style: StrokeStyle(
                                    lineWidth: 0.5,
                                    dash: [2, 1]
                                )
                            )
                            .frame(height: 1)
                            .padding(.horizontal, 24) // Add horizontal padding (left and right)
                            .padding(.vertical, 20)
                            
                            HStack(spacing: 24) {
                                // LEFT SIDE - 2x2 Grid
                                VStack(alignment: .center, spacing: 10) {
                                    LazyVGrid(
                                        columns: [
                                            GridItem(.flexible(), spacing: 15),
                                            GridItem(.flexible(), spacing: 15)
                                        ],
                                        spacing: 20
                                    ) {
                                        // First item
                                        VStack {
                                            ZStack {
                                                // Content inside the circle
                                            }
                                            .frame(width: 66, height: 66)
                                            .background(
                                                LinearGradient(
                                                    stops: [
                                                        Gradient.Stop(color: Color(red: 0.95, green: 0.95, blue: 0.95), location: 0.00),
                                                        Gradient.Stop(color: Color(red: 0.98, green: 0.98, blue: 0.98), location: 1.00),
                                                    ],
                                                    startPoint: UnitPoint(x: 0.5, y: 0.07),
                                                    endPoint: UnitPoint(x: 0.5, y: 1)
                                                )
                                            )
                                            .cornerRadius(80)
                                            .shadow(color: .black.opacity(0.06), radius: 7, x: 0, y: 4)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 80)
                                                    .inset(by: 2)
                                                    .stroke(.white, lineWidth: 4)
                                            )
                                            
                                            Text("CIBIL score")
                                              .font(
                                                Font.custom("Inter", size: 10)
                                                  .weight(.medium)
                                              )
                                              .kerning(1)
                                              .multilineTextAlignment(.center)
                                              .foregroundColor(.black)
                                        }
                                        
                                        // Second item
                                        VStack {
                                            ZStack {
                                                // Content inside the circle
                                            }
                                            .frame(width: 66, height: 66)
                                            .background(
                                                LinearGradient(
                                                    stops: [
                                                        Gradient.Stop(color: Color(red: 0.95, green: 0.95, blue: 0.95), location: 0.00),
                                                        Gradient.Stop(color: Color(red: 0.98, green: 0.98, blue: 0.98), location: 1.00),
                                                    ],
                                                    startPoint: UnitPoint(x: 0.5, y: 0.07),
                                                    endPoint: UnitPoint(x: 0.5, y: 1)
                                                )
                                            )
                                            .cornerRadius(80)
                                            .shadow(color: .black.opacity(0.06), radius: 7, x: 0, y: 4)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 80)
                                                    .inset(by: 2)
                                                    .stroke(.white, lineWidth: 4)
                                            )
                                            
                                            Text("Garage")
                                              .font(
                                                Font.custom("Inter", size: 10)
                                                  .weight(.medium)
                                              )
                                              .kerning(1)
                                              .multilineTextAlignment(.center)
                                              .foregroundColor(.black)
                                        }
                                        
                                        // Third item
                                        VStack {
                                            ZStack {
                                                // Content inside the circle
                                            }
                                            .frame(width: 66, height: 66)
                                            .background(
                                                LinearGradient(
                                                    stops: [
                                                        Gradient.Stop(color: Color(red: 0.95, green: 0.95, blue: 0.95), location: 0.00),
                                                        Gradient.Stop(color: Color(red: 0.98, green: 0.98, blue: 0.98), location: 1.00),
                                                    ],
                                                    startPoint: UnitPoint(x: 0.5, y: 0.07),
                                                    endPoint: UnitPoint(x: 0.5, y: 1)
                                                )
                                            )
                                            .cornerRadius(80)
                                            .shadow(color: .black.opacity(0.06), radius: 7, x: 0, y: 4)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 80)
                                                    .inset(by: 2)
                                                    .stroke(.white, lineWidth: 4)
                                            )
                                            
                                            Text("Feature 3")
                                              .font(
                                                Font.custom("Inter", size: 10)
                                                  .weight(.medium)
                                              )
                                              .kerning(1)
                                              .multilineTextAlignment(.center)
                                              .foregroundColor(.black)
                                        }
                                        
                                        // Fourth item
                                        VStack {
                                            ZStack {
                                                // Content inside the circle
                                            }
                                            .frame(width: 66, height: 66)
                                            .background(
                                                LinearGradient(
                                                    stops: [
                                                        Gradient.Stop(color: Color(red: 0.95, green: 0.95, blue: 0.95), location: 0.00),
                                                        Gradient.Stop(color: Color(red: 0.98, green: 0.98, blue: 0.98), location: 1.00),
                                                    ],
                                                    startPoint: UnitPoint(x: 0.5, y: 0.07),
                                                    endPoint: UnitPoint(x: 0.5, y: 1)
                                                )
                                            )
                                            .cornerRadius(80)
                                            .shadow(color: .black.opacity(0.06), radius: 7, x: 0, y: 4)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 80)
                                                    .inset(by: 2)
                                                    .stroke(.white, lineWidth: 4)
                                            )
                                            
                                            Text("Feature 4")
                                              .font(
                                                Font.custom("Inter", size: 10)
                                                  .weight(.medium)
                                              )
                                              .kerning(1)
                                              .multilineTextAlignment(.center)
                                              .foregroundColor(.black)
                                        }
                                    }
                                }
                                .padding(0)
                                .frame(width: 147, height: 174, alignment: .center)
                                
                                // RIGHT SIDE - VStack
                                VStack(alignment: .center, spacing: 10) {
                                    ZStack {
                                        
                                    }
                                    .frame(maxWidth: .infinity, minHeight: 160, maxHeight: 160)
                                    .background(Color(red: 0.15, green: 0.33, blue: 0.25))
                                    .cornerRadius(10)
                                    
                                    HStack(alignment: .center, spacing: 3) { Image("")
                                            .frame(width: 4, height: 4)
                                            .background(Color(red: 0.52, green: 0.52, blue: 0.52))
                                        
                                        Image("")
                                          .frame(width: 4, height: 4)
                                          .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        
                                        Image("")
                                          .frame(width: 4, height: 4)
                                          .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        
                                        Image("")
                                          .frame(width: 4, height: 4)
                                          .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    }
                                    .padding(0)
                                }
                                .padding(0)
                                .frame(width: 147, height: 174, alignment: .center)
                            }
                            ZStack{
                                
                            }
                            .frame(maxWidth: .infinity, minHeight: 110)
                            
                            
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height - 145) // Using geometry correctly
                    .background(Color.white)
                    .cornerRadius(20)
                }
            } // End of GeometryReader
        }
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    HomeView()
}
