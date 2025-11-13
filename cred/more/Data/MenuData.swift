//
//  MenuData.swift
//  cred
//
//  Data source for menu items - Easy to update content here
//  To add navigation, pass a router in the action closure
//

import SwiftUI

struct MenuData {
    // Helper function to create menu items with router navigation
    static func createItems(with router: AppRouter) -> MenuDataWithRouter {
        return MenuDataWithRouter(router: router)
    }
    
    // Popular section items
    static let popularItems: [MenuItem] = [
        MenuItem(
            icon: .sfSymbol("creditcard.fill"),
            title: "Cards",
            subtitle: "Manage"
        ),
        MenuItem(
            icon: .sfSymbol("gift.fill"),
            title: "Rewards",
            subtitle: "Earn"
        ),
        MenuItem(
            icon: .sfSymbol("wallet.pass.fill"),
            title: "Wallet",
            subtitle: "Pay"
        ),
        MenuItem(
            icon: .sfSymbol("chart.line.uptrend.xyaxis"),
            title: "Analytics",
            subtitle: "Track"
        )
    ]
    
    // Finance section items
    static let financeItems: [MenuItem] = [
        MenuItem(
            icon: .sfSymbol("banknote.fill"),
            title: "Pay Bills",
            subtitle: nil
        ),
        MenuItem(
            icon: .sfSymbol("chart.pie.fill"),
            title: "Invest",
            subtitle: nil
        ),
        MenuItem(
            icon: .sfSymbol("dollarsign.circle.fill"),
            title: "Loans",
            subtitle: nil
        ),
        MenuItem(
            icon: .sfSymbol("building.columns.fill"),
            title: "Banking",
            subtitle: nil
        )
    ]
    
    // Settings section items
    static let settingsItems: [MenuItem] = [
        MenuItem(
            icon: .sfSymbol("person.fill"),
            title: "Profile",
            subtitle: nil
        ),
        MenuItem(
            icon: .sfSymbol("gearshape.fill"),
            title: "Settings",
            subtitle: nil
        ),
        MenuItem(
            icon: .sfSymbol("questionmark.circle.fill"),
            title: "Help",
            subtitle: nil
        ),
        MenuItem(
            icon: .sfSymbol("info.circle.fill"),
            title: "About",
            subtitle: nil
        )
    ]
    
    // Example with custom images (if you have them in Assets)
    static let customItems: [MenuItem] = [
        MenuItem(
            icon: .image("vry"),  // Using existing asset
            title: "Custom",
            subtitle: "Item"
        ),
        // Add more custom items as needed
    ]
}

// Helper class to create menu items with router actions
class MenuDataWithRouter {
    let router: AppRouter
    
    init(router: AppRouter) {
        self.router = router
    }
    
    // Popular items with navigation
    var popularItemsWithActions: [MenuItem] {
        [
            MenuItem(
                icon: .sfSymbol("creditcard.fill"),
                title: "bills & recharges",
                subtitle: nil,
                action: { self.router.navigate(to: .cards) }
            ),
            MenuItem(
                icon: .sfSymbol("gift.fill"),
                title: "pay contacts",
                subtitle: nil,
                action: { self.router.navigate(to: .rewards) }
            ),
            MenuItem(
                icon: .sfSymbol("wallet.pass.fill"),
                title: "house rent",
                subtitle: nil,
                action: { self.router.navigate(to: .wallet) }
            ),
            MenuItem(
                icon: .sfSymbol("chart.line.uptrend.xyaxis"),
                title: "garage",
                subtitle: nil,
                action: { self.router.navigate(to: .analytics) }
            )
        ]
    }
    
    // Finance items with navigation
    var financeItemsWithActions: [MenuItem] {
        [
            MenuItem(
                icon: .sfSymbol("banknote.fill"),
                title: "money",
                subtitle: nil,
                action: { self.router.navigate(to: .payBills) }
            ),
            MenuItem(
                icon: .sfSymbol("chart.pie.fill"),
                title: "cash",
                subtitle: nil,
                action: { self.router.navigate(to: .invest) }
            ),
            MenuItem(
                icon: .sfSymbol("dollarsign.circle.fill"),
                title: "bank balance",
                subtitle: nil,
                action: { self.router.navigate(to: .loans) }
            ),
            MenuItem(
                icon: .sfSymbol("building.columns.fill"),
                title: "bank accounts",
                subtitle: nil,
                action: { self.router.navigate(to: .banking) }
            ),
            MenuItem(
                icon: .sfSymbol("banknote.fill"),
                title: "gold",
                subtitle: nil,
                action: { self.router.navigate(to: .payBills) }
            ),
            MenuItem(
                icon: .sfSymbol("chart.pie.fill"),
                title: "CIBIL score",
                subtitle: nil,
                action: { self.router.navigate(to: .invest) }
            ),
            MenuItem(
                icon: .sfSymbol("dollarsign.circle.fill"),
                title: "CRED wallet",
                subtitle: nil,
                action: { self.router.navigate(to: .loans) }
            )
        ]
    }
    
    // Settings items with navigation
    var settingsItemsWithActions: [MenuItem] {
        [
            MenuItem(
                icon: .sfSymbol("person.fill"),
                title: "Profile",
                subtitle: nil,
                action: { self.router.navigate(to: .profile) }
            ),
            MenuItem(
                icon: .sfSymbol("gearshape.fill"),
                title: "Settings",
                subtitle: nil,
                action: { self.router.navigate(to: .settings) }
            ),
            MenuItem(
                icon: .sfSymbol("questionmark.circle.fill"),
                title: "Help",
                subtitle: nil,
                action: { self.router.navigate(to: .help) }
            ),
            MenuItem(
                icon: .sfSymbol("info.circle.fill"),
                title: "About",
                subtitle: nil,
                action: { self.router.navigate(to: .about) }
            )
        ]
    }
}

