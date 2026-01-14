import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Black background for the entire view
            Color.black
            
            // Your home view content here
            GeometryReader { geometry in // Add GeometryReader here
                VStack(alignment: .center) {
                    
                 ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            // Add your content here
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height - 11) // Using geometry correctly
                    .background(Color.white)
                    .cornerRadius(20)
                }
            } // End of GeometryReader
        }
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    MainView()
}
