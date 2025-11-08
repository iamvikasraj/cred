//
//  AppRouter.swift
//  cred
//
//  Created for navigation routing
//

import SwiftUI

// MARK: - Navigation Routes
enum Route: Hashable {
    case home
    case cards
    case cardDetail(cardId: String)
    case scan
    case rewards
    case rewardDetail(rewardId: String)
    case more
    case settings
    case profile
    // Add more routes as needed
}

// MARK: - Router Observable Object
class AppRouter: ObservableObject {
    @Published var navigationPath = NavigationPath()
    @Published var currentRoute: Route?
    
    // Navigate to a specific route
    func navigate(to route: Route) {
        currentRoute = route
        navigationPath.append(route)
    }
    
    // Navigate back
    func goBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    // Navigate to root
    func navigateToRoot() {
        navigationPath.removeLast(navigationPath.count)
        currentRoute = nil
    }
    
    // Pop to a specific route
    func popToRoute(_ route: Route) {
        // Implementation for popping to a specific route
        // This is a simplified version
        navigateToRoot()
        navigate(to: route)
    }
}

// MARK: - Router View Modifier
struct RouterView: ViewModifier {
    let router: AppRouter
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Route.self) { route in
                destinationView(for: route)
                    .environmentObject(router)
            }
    }
    
    @ViewBuilder
    private func destinationView(for route: Route) -> some View {
        switch route {
        case .home:
            HomeView()
        case .cards:
            cardView()
        case .cardDetail(let cardId):
            CardDetailView(cardId: cardId)
        case .scan:
            scanView()
        case .rewards:
            rewards()
        case .rewardDetail(let rewardId):
            RewardDetailView(rewardId: rewardId)
        case .more:
            more()
        case .settings:
            SettingsView()
        case .profile:
            ProfileView()
        }
    }
}

extension View {
    func withRouter(_ router: AppRouter) -> some View {
        modifier(RouterView(router: router))
    }
}

