//
//  AppRouter.swift
//  cred
//
//  Created for navigation routing
//

import SwiftUI

// MARK: - Navigation Routes

/// Detail screens pushed onto the navigation stack.
/// Tab screens are not routes — switch tabs via `AppRouter.switchTab(to:)`.
enum Route: Hashable {
    case cardDetail(cardId: String)
    case rewardDetail(rewardId: String)
    case settings
    case profile
    case wallet
    case analytics
    case payBills
    case invest
    case loans
    case banking
    case help
    case about
}

// MARK: - Router

@MainActor
@Observable
final class AppRouter {
    var navigationPath = NavigationPath()
    var selectedTab: MainView.Tab = .home

    func navigate(to route: Route) {
        navigationPath.append(route)
    }

    /// Switching tabs always returns to the stack root, matching CRED's behavior.
    func switchTab(to tab: MainView.Tab) {
        navigateToRoot()
        selectedTab = tab
    }

    func goBack() {
        guard !navigationPath.isEmpty else { return }
        navigationPath.removeLast()
    }

    func navigateToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}

// MARK: - Router View Modifier

struct RouterView: ViewModifier {
    let router: AppRouter

    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Route.self) { route in
                destinationView(for: route)
                    .environment(router)
            }
    }

    @ViewBuilder
    private func destinationView(for route: Route) -> some View {
        switch route {
        case .cardDetail(let cardId):
            CardDetailView(cardId: cardId)
        case .rewardDetail(let rewardId):
            RewardDetailView(rewardId: rewardId)
        case .settings:
            SettingsView()
        case .profile:
            ProfileView()
        case .wallet:
            WalletView()
        case .analytics:
            AnalyticsView()
        case .payBills:
            PayBillsView()
        case .invest:
            InvestView()
        case .loans:
            LoansView()
        case .banking:
            BankingView()
        case .help:
            HelpView()
        case .about:
            AboutView()
        }
    }
}

extension View {
    func withRouter(_ router: AppRouter) -> some View {
        modifier(RouterView(router: router))
    }
}
