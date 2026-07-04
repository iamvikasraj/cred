import SwiftUI
import RiveRuntime

struct MainView: View {
    @State private var router = AppRouter()

    enum Tab: String, CaseIterable {
        case home, cards, scan, rewards, more
    }

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            VStack(spacing: 0) {
                TabContent()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                CustomTabBar()
            }
            .withRouter(router)
            .ignoresSafeArea(edges: .bottom)
            .environment(\.font, AppSansFont.font(size: AppSansFont.bodySize))
        }
        .environment(router)
    }
}

struct TabContent: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        ZStack {
            pane(.home) { HomeView() }
            pane(.cards) { cardView() }
            pane(.scan) { scanView() }
            pane(.rewards) { rewards() }
            pane(.more) { more() }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    /// Keeps every tab mounted so scroll positions and view state
    /// survive tab switches; only the selected pane is visible and hittable.
    @ViewBuilder
    private func pane<V: View>(_ tab: MainView.Tab, @ViewBuilder content: () -> V) -> some View {
        let isSelected = router.selectedTab == tab
        content()
            .opacity(isSelected ? 1 : 0)
            .allowsHitTesting(isSelected)
            .accessibilityHidden(!isSelected)
    }
}

struct CustomTabBar: View {
    @Environment(AppRouter.self) private var router
    @State private var riveViewModel: RiveViewModel?

    var body: some View {
        ZStack {
            if let riveModel = riveViewModel {
                riveModel.view()
                    .frame(height: 135)
                    .background(Color.clear)
            }

            HStack(spacing: 0) {
                ForEach(MainView.Tab.allCases, id: \.self) { tab in
                    Button {
                        router.switchTab(to: tab)
                    } label: {
                        Color.clear
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .contentShape(Rectangle())
                    }
                    .accessibilityLabel(Text(tab.rawValue))
                    .accessibilityAddTraits(router.selectedTab == tab ? .isSelected : [])
                }
            }
            .padding(.horizontal, 12)
        }
        .frame(height: 100)
        .onAppear(perform: setupRive)
        .onChange(of: router.selectedTab) { _, newValue in
            updateRiveState(for: newValue)
        }
    }

    private func setupRive() {
        guard !isRunningForPreviews, riveViewModel == nil else { return }
        riveViewModel = RiveViewModel(
            fileName: "cred",
            stateMachineName: "nav",
            autoPlay: true
        )
        updateRiveState(for: router.selectedTab)
    }

    private func updateRiveState(for tab: MainView.Tab) {
        guard !isRunningForPreviews else { return }
        guard let riveModel = riveViewModel else { return }
        for t in MainView.Tab.allCases {
            riveModel.setInput(t.rawValue, value: t == tab)
        }
    }
}

private var isRunningForPreviews: Bool {
    ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" ||
    ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PLAYGROUNDS"] == "1"
}

#Preview {
    MainView()
}
