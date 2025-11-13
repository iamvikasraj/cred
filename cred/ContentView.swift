import SwiftUI
import RiveRuntime

// Main app structure with tab view
struct MainView: View {
    @StateObject private var router = AppRouter()
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home
        case cards
        case scan
        case rewards
        case more
    }
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    // Content based on selected tab
                    TabContent(selectedTab: selectedTab)
                        .environmentObject(router)
                    
                    // Custom animated tab bar
                    CustomTabBar(selectedTab: $selectedTab)
                        
                }
                .withRouter(router)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
   }

// Tab content view that changes based on selected tab
struct TabContent: View {
    let selectedTab: MainView.Tab
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        Group {
            switch selectedTab {
            case .home:
                HomeView()
                    .environmentObject(router)
            case .rewards:
                rewards()
                    .environmentObject(router)
            case .cards:
                cardView()
                    .environmentObject(router)
            case .scan:
                scanView()
                    .environmentObject(router)
            case .more:
                more()
                    .environmentObject(router)
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
            setupRive()
        }
        .onChange(of: selectedTab) { oldValue, newValue in
            // Update Rive state when tab changes
            updateRiveState(for: newValue)
        }
    }
    
    // Setup Rive animation
    private func setupRive() {
        if riveViewModel == nil {
            riveViewModel = RiveViewModel(
                fileName: "cred",
                stateMachineName: "nav",
                autoPlay: true
            )
            
            // Initialize with current tab after a small delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                updateRiveState(for: selectedTab)
            }
        } else {
            // If already set up, just update the state
            updateRiveState(for: selectedTab)
        }
    }
    
    // Update Rive state for a specific tab
    private func updateRiveState(for tab: MainView.Tab) {
        guard let riveModel = riveViewModel else { return }
        
        // Reset all inputs first
        resetAllInputs()
        
        // Set the current tab's input to true
        let inputName = getInputName(for: tab)
        riveModel.setInput(inputName, value: true)
    }
    
    // Helper function to update tab and handle Rive inputs
    private func updateTab(_ tab: MainView.Tab) {
        // Only update if it's a different tab
        if selectedTab != tab {
            // Update the selected tab
            selectedTab = tab
            // Rive state will update via onChange modifier
        }
    }
    
    // Helper to reset all inputs to false
    private func resetAllInputs() {
        guard let riveModel = riveViewModel else { return }
        riveModel.setInput("home", value: false)
        riveModel.setInput("cards", value: false)
        riveModel.setInput("scan", value: false)
        riveModel.setInput("rewards", value: false)
        riveModel.setInput("more", value: false)
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
