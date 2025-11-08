import SwiftUI

struct rewards: View {
    var body: some View {
        ZStack {
            // Black background for the entire view
            Color.black
                .ignoresSafeArea() // This ignores all safe areas
            
            GeometryReader { geometry in
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            VStack(alignment: .center, spacing: 59) {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 252, height: 34)
                                  .background(Color(red: 0.88, green: 0.88, blue: 0.88))
                                
                                HStack(alignment: .center, spacing: 10) {
                                    
                                }
                                .padding(10)
                                
                                .frame(maxWidth: 264, minHeight: 273, maxHeight: 273, alignment: .leading)
                                .background(.white)
                                .overlay(
                                  Rectangle()
                                    .stroke(Color(red: 0.45, green: 0.19, blue: 1), lineWidth: 18)
                                )
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    Image("Rectangle 27")
                                      .frame(width: 254, height: 51)
                                      .background(Color(red: 1, green: 0.92, blue: 0))
                                    
                                    Image("Rectangle 28")
                                      .frame(width: 254, height: 10)
                                      .background(Color(red: 0.91, green: 0.82, blue: 0))
                                }
                                .padding(.bottom, 60)
                            }
                            .padding(.top, 60)
                            .padding(0)
                            
                            VStack (alignment:.leading, spacing: 0) {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(maxWidth: 172, minHeight: 28, maxHeight: 28)
                                  .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                
                                
                            }
                            .frame( maxWidth: .infinity, minHeight: 400)
                            .background(.white)
                        }
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
    rewards()
}
