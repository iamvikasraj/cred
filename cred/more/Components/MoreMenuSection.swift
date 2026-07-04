import SwiftUI

struct MoreMenuSection: View {
    let title: String
    let rows: [[MenuItem]]
    let metrics: MoreMetrics
    var usesFlexColumns: Bool = false
    var rowSideInset: CGFloat = 0
    var columns: Int = 4

    var body: some View {
        VStack(alignment: .leading, spacing: metrics.sectionHeaderSpacing) {
            HomeSectionLabel(text: title)

            VStack(alignment: .leading, spacing: metrics.scaled(20)) {
                ForEach(Array(rows.enumerated()), id: \.offset) { _, row in
                    menuRow(row)
                }
            }
        }
        .frame(width: metrics.contentWidth, alignment: .leading)
    }

    private func menuRow(_ items: [MenuItem]) -> some View {
        let sideInset = usesFlexColumns ? metrics.menuRowSideInset : rowSideInset
        let isFullFlexRow = usesFlexColumns && items.count >= columns

        return HStack(alignment: .top, spacing: metrics.menuGridReferenceGap) {
            ForEach(items) { item in
                MoreMenuTile(
                    item: item,
                    metrics: metrics,
                    columnWidth: isFullFlexRow
                        ? metrics.flexColumnWidth(columns: columns, sideInset: sideInset)
                        : metrics.menuItemWidth
                )
            }
        }
        .padding(.horizontal, sideInset)
        .frame(
            width: isFullFlexRow ? metrics.contentWidth : packedRowWidth(itemCount: items.count, sideInset: sideInset),
            alignment: .leading
        )
    }

    /// Width for partial rows so tiles stay grouped on the left with fixed 28pt gaps.
    private func packedRowWidth(itemCount: Int, sideInset: CGFloat) -> CGFloat {
        let count = CGFloat(max(itemCount, 1))
        let gaps = max(count - 1, 0) * metrics.menuGridReferenceGap
        let tiles = count * metrics.menuItemWidth
        return (sideInset * 2) + tiles + gaps
    }
}
