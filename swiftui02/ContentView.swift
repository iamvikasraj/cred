import SwiftUI
import RiveRuntime

// Main app structure with tab view
struct MainView: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home
        case cards
        case scan
        case rewards
        case more
    }
    
    var body: some View {
           GeometryReader { geometry in
               VStack(spacing: 0) {
                   // Content based on selected tab
                   TabContent(selectedTab: selectedTab)
                   
                   // Custom animated tab bar
                   CustomTabBar(selectedTab: $selectedTab)
                       
               }
           }
           .ignoresSafeArea(edges: .bottom)
       }
   }

// Tab content view that changes based on selected tab
struct TabContent: View {
    let selectedTab: MainView.Tab
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .home:
                HomeView()
            case .rewards:
                rewards()
            case .cards:
                cardView()
            case .scan:
                scanView()
            case .more:
                more()
            }
        }
    }
}

// Custom tab bar with Rive animation
struct CustomTabBar: View {
    @Binding var selectedTab: MainView.Tab
    @State private var riveViewModel: RiveViewModel?

    var body: some View {
        ZStack {
            // Background Bar
            Rectangle()
                .frame(height: 135)
                .background(Color.white).opacity(0)
                .ignoresSafeArea(edges: .bottom)
            
            // Rive Animation (behind everything)
            if let riveModel = riveViewModel {
                riveModel.view()
                    .frame(height: 135)
                    .background(Color.clear)
                    .zIndex(1)  // Ensure animation is behind buttons
            }
            
            // Transparent Buttons (on top of Rive)
            HStack {
                // Home button
                Button(action: {
                    updateTab(.home)
                }) {
                    Rectangle()
                        .fill(Color.gray).opacity(0.0) // Semi-transparent for testing
                        .frame(width: 60, height: 80)
                }
                .offset(x: -10, y: -10)
                
                // Cards button
                Button(action: {
                    updateTab(.cards)
                }) {
                    Rectangle()
                        .fill(Color.gray).opacity(0.0)
                        .frame(width: 60, height: 80)
                }
                .offset(x: -5, y: -10)
                
                // Scan button
                Button(action: {
                    updateTab(.scan)
                }) {
                    Rectangle()
                        .fill(Color.gray).opacity(0.0)
                        .frame(width: 80, height: 80)
                }
                .offset(x: 0, y: -10)
                
                // Rewards button
                Button(action: {
                    updateTab(.rewards)
                }) {
                    Rectangle()
                        .fill(Color.gray).opacity(0.0)
                        .frame(width: 60, height: 80)
                }
                .offset(x: 5, y: -10)
                
                // More button
                Button(action: {
                    updateTab(.more)
                }) {
                    Rectangle()
                        .fill(Color.gray).opacity(0.0)
                        .frame(width: 60, height: 80)
                }
                .offset(x: 8, y: -10)
            }
            .zIndex(2)  // Ensure buttons are above animation
        }
        .frame(height: 100)
        .onAppear {
            riveViewModel = RiveViewModel(
                fileName: "cred",
                stateMachineName: "nav",
                autoPlay: true
            )
            
            // Initialize with current tab
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                updateTab(selectedTab)
            }
        }
    }
    
    // Helper function to update tab and handle Rive inputs
    private func updateTab(_ tab: MainView.Tab) {
        // Only update if it's a different tab
        if selectedTab != tab {
            // Update the selected tab
            selectedTab = tab
            
            // Reset all inputs
            resetAllInputs()
            
            // Set the new tab's input to true
            riveViewModel?.setInput(getInputName(for: tab), value: true)
        }
    }
    
    // Helper to reset all inputs to false
    private func resetAllInputs() {
        riveViewModel?.setInput("home", value: false)
        riveViewModel?.setInput("cards", value: false)
        riveViewModel?.setInput("scan", value: false)
        riveViewModel?.setInput("rewards", value: false)
        riveViewModel?.setInput("more", value: false)
    }
    
    // Helper to get input name for a tab
    private func getInputName(for tab: MainView.Tab) -> String {
        switch tab {
        case .home: return "home"
        case .cards: return "cards"
        case .scan: return "scan"
        case .rewards: return "rewards"
        case .more: return "more"
        }
    }
}


// Update preview to use the MainView
#Preview {
    MainView()
}
