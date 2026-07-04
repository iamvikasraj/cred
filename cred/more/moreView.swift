//
//  moreView.swift
//  cred
//
//  Created by Vikas Raj Yadav on 29/04/25.
//

import SwiftUI

/// [Figma 157:2081](https://www.figma.com/design/8Em1u56aZPgb46USBkO9Jj/CRED?node-id=157-2081)
struct more: View {
    @Environment(AppRouter.self) private var router

    /// Built once on first appearance; rebuilding per body evaluation would
    /// recreate every menu action closure on each render.
    @State private var menuData: MenuDataWithRouter?

    var body: some View {
        TabScreenShell(background: Color(red: 254 / 255, green: 255 / 255, blue: 255 / 255)) { width in
            let metrics = MoreMetrics(containerWidth: width)

            VStack(spacing: 0) {
                MoreSearchHeader(metrics: metrics)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, metrics.searchHorizontalInset)
                    .padding(.top, metrics.topPadding)

                if let menuData {
                    moreScrollContent(menuData: menuData, metrics: metrics)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, metrics.horizontalInset)
                        .padding(.bottom, metrics.scrollBottomInset)
                }
            }
        }
        .onAppear {
            if menuData == nil {
                menuData = MenuData.createItems(with: router)
            }
        }
    }

    @ViewBuilder
    private func moreScrollContent(menuData: MenuDataWithRouter, metrics: MoreMetrics) -> some View {
        VStack(alignment: .leading, spacing: metrics.sectionSpacing) {
            MoreMenuSection(
                title: "FOR YOU",
                rows: menuData.forYouRows,
                metrics: metrics
            )

            MorePromoBanner(metrics: metrics)

            MoreMenuSection(
                title: "MONEY MATTERS",
                rows: menuData.moneyMattersRows,
                metrics: metrics,
                usesFlexColumns: true
            )

            MoreMenuSection(
                title: "BILLS",
                rows: menuData.billsRows,
                metrics: metrics,
                usesFlexColumns: true
            )

            MoreMenuSection(
                title: "PAYMENTS",
                rows: menuData.paymentsRows,
                metrics: metrics,
                rowSideInset: metrics.menuRowSideInset
            )

            MoreMenuSection(
                title: "EXPLORE",
                rows: menuData.exploreRows,
                metrics: metrics,
                rowSideInset: metrics.menuRowSideInset
            )

            MoreMenuSection(
                title: "BENEFITS",
                rows: menuData.benefitsRows,
                metrics: metrics,
                rowSideInset: metrics.menuRowSideInset
            )

            MoreMenuSection(
                title: "OTHERS",
                rows: menuData.othersRows,
                metrics: metrics,
                rowSideInset: metrics.menuRowSideInset
            )
        }
        .frame(width: metrics.contentWidth, alignment: .leading)
    }
}

#Preview {
    more()
        .environment(AppRouter())
}
