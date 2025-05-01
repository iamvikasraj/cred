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
                            // Your rewards content here
                            
                            // Center the Scan text both horizontally and vertically
                            Spacer() // Pushes content down
                            
                            Text("rewards")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .foregroundStyle(Color.gray)
                                .frame(maxWidth: .infinity) // Make text container full width
                                .padding(.bottom, 20)
                            
                            Spacer() // Pushes content up
                        }
                        .frame(minHeight: geometry.size.height - 22) // Ensure VStack fills ScrollView minus padding
                        .padding(.top, 60)
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
}

#Preview {
    MainView()
}
