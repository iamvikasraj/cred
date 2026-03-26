import SwiftUI
import RiveRuntime

struct MainView: View {
    @StateObject private var router = AppRouter()
    @State private var selectedTab: Tab = .home

    enum Tab: String, CaseIterable {
        case home, cards, scan, rewards, more
    }

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            VStack(spacing: 0) {
                TabContent(selectedTab: selectedTab)
                    .environmentObject(router)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                CustomTabBar(selectedTab: $selectedTab)
            }
            .withRouter(router)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct TabContent: View {
    let selectedTab: MainView.Tab
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        Group {
            switch selectedTab {
            case .home: HomeView()
            case .rewards: rewards()
            case .cards: cardView()
            case .scan: scanView()
            case .more: more()
            }
        }
        .environmentObject(router)
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: MainView.Tab
    @State private var riveViewModel: RiveViewModel?

    private struct HitArea: Identifiable {
        let tab: MainView.Tab
        let width: CGFloat
        let x: CGFloat
        var id: MainView.Tab { tab }
    }

    private static let hitAreas: [HitArea] = [
        HitArea(tab: .home, width: 60, x: -10),
        HitArea(tab: .cards, width: 60, x: -5),
        HitArea(tab: .scan, width: 80, x: 0),
        HitArea(tab: .rewards, width: 60, x: 5),
        HitArea(tab: .more, width: 60, x: 8),
    ]

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 135)
                .background(Color.white).opacity(0)
                .ignoresSafeArea(edges: .bottom)

            if let riveModel = riveViewModel {
                riveModel.view()
                    .frame(height: 135)
                    .background(Color.clear)
                    .zIndex(1)
            }

            HStack {
                ForEach(Self.hitAreas) { area in
                    Button {
                        if selectedTab != area.tab { selectedTab = area.tab }
                    } label: {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: area.width, height: 80)
                    }
                    .offset(x: area.x, y: -10)
                }
            }
            .zIndex(2)
        }
        .frame(height: 100)
        .onAppear(perform: setupRive)
        .onChange(of: selectedTab) { _, newValue in
            updateRiveState(for: newValue)
        }
    }

    private func setupRive() {
        if riveViewModel == nil {
            riveViewModel = RiveViewModel(
                fileName: "cred",
                stateMachineName: "nav",
                autoPlay: true
            )
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                updateRiveState(for: selectedTab)
            }
        } else {
            updateRiveState(for: selectedTab)
        }
    }

    private func updateRiveState(for tab: MainView.Tab) {
        guard let riveModel = riveViewModel else { return }
        for t in MainView.Tab.allCases {
            riveModel.setInput(t.rawValue, value: t == tab)
        }
    }
}

#Preview {
    MainView()
}
