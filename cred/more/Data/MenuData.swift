//
//  MenuData.swift
//  cred
//
//  Data source for menu items - Easy to update content here
//

import SwiftUI

struct MenuData {
    @MainActor
    static func createItems(with router: AppRouter) -> MenuDataWithRouter {
        MenuDataWithRouter(router: router)
    }
}

@MainActor
final class MenuDataWithRouter {
    let router: AppRouter

    init(router: AppRouter) {
        self.router = router
    }

    /// [Figma 155:1890](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=155-1890)
    var forYouRows: [[MenuItem]] {
        [
            [
                item("garage"),
                item("bills & recharges", lines: ["bills &", "recharges"], icon: "more_bills", iconWidth: 20, iconHeight: 22.5),
                item("pay contacts", lines: ["pay", "contacts"], icon: "more_pay_contacts", iconWidth: 22.5, iconHeight: 22),
                item("payment history", lines: ["payment", "history"], icon: "more_payment_history", iconWidth: 14, iconHeight: 16),
            ],
        ]
    }

    /// [Figma 159:2153](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=159-2153)
    var moneyMattersRows: [[MenuItem]] {
        [
            [
                item("money", action: { self.router.navigate(to: .payBills) }),
                item("cash", action: { self.router.navigate(to: .invest) }),
                item("CIBIL score", icon: "more_cibil", iconWidth: 15, iconHeight: 15, action: { self.router.navigate(to: .analytics) }),
                item("bank balance", lines: ["bank", "balance"], action: { self.router.navigate(to: .loans) }),
            ],
            [
                item("bank accounts", lines: ["bank", "accounts"], icon: "more_bank_accounts", iconWidth: 14.5, iconHeight: 14.5, action: { self.router.navigate(to: .banking) }),
                item("gold"),
                item("silver"),
                item("fixed deposit", lines: ["fixed", "deposit"]),
            ],
            [
                item("CRED wallet", lines: ["CRED", "wallet"], action: { self.router.navigate(to: .wallet) }),
            ],
        ]
    }

    /// [Figma 159:2195](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=159-2195)
    var billsRows: [[MenuItem]] {
        [
            [
                item("credit card", action: { self.router.switchTab(to: .cards) }),
                item("bills & recharges", lines: ["bills &", "recharges"], icon: "more_bills", iconWidth: 20, iconHeight: 22.5),
                item("house rent"),
                item("education fees", icon: "more_education", iconWidth: 25, iconHeight: 20.033),
            ],
            [
                item("motor insurance", lines: ["motor", "insurance"]),
            ],
        ]
    }

    /// [Figma 159:2322](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=159-2322)
    var paymentsRows: [[MenuItem]] {
        [
            [
                item("scan & pay", action: { self.router.switchTab(to: .scan) }),
                item("pay contacts", lines: ["pay", "contacts"], icon: "more_pay_contacts", iconWidth: 22.5, iconHeight: 22),
            ],
        ]
    }

    /// [Figma 159:2343](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=159-2343)
    var exploreRows: [[MenuItem]] {
        [
            [
                item("shop"),
                item("garage"),
                item("gift cards", lines: ["gift", "cards"]),
            ],
        ]
    }

    /// [Figma 159:2365](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=159-2365)
    var benefitsRows: [[MenuItem]] {
        [
            [
                item("refer", icon: "more_refer", iconWidth: 16, iconHeight: 15.5),
                item("coins"),
                item("vouchers"),
            ],
        ]
    }

    /// [Figma 159:2377](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=159-2377)
    var othersRows: [[MenuItem]] {
        [
            [
                item("support", icon: "more_support", iconWidth: 16, iconHeight: 15.5, action: { self.router.navigate(to: .help) }),
                item("payment history", lines: ["payment", "history"], icon: "more_payment_history", iconWidth: 14, iconHeight: 16),
                item("settings", action: { self.router.navigate(to: .settings) }),
            ],
        ]
    }

    private func item(
        _ title: String,
        lines: [String]? = nil,
        icon: String? = nil,
        iconWidth: CGFloat? = nil,
        iconHeight: CGFloat? = nil,
        action: (@MainActor () -> Void)? = nil
    ) -> MenuItem {
        MenuItem(
            title: title,
            titleLines: lines,
            iconAssetName: icon,
            iconWidth: iconWidth,
            iconHeight: iconHeight,
            action: action
        )
    }
}
