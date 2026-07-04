//
//  SnapshotTests.swift
//  credTests
//
//  Pixel-locks screens to the 393pt Figma reference frame.
//  First run records reference images under __Snapshots__/;
//  subsequent runs diff against them.
//

import Testing
import SnapshotTesting
import SwiftUI
@testable import cred

@MainActor
struct SnapshotTests {

    /// Matches the Figma reference frame (393 × 852, iPhone 14 Pro class).
    private static let referenceLayout = SwiftUISnapshotLayout.fixed(width: 393, height: 852)

    @Test func homeMatchesReference() {
        assertSnapshot(
            of: HomeView().environment(AppRouter()),
            as: .image(layout: Self.referenceLayout)
        )
    }

    @Test func moreMatchesReference() {
        assertSnapshot(
            of: more().environment(AppRouter()),
            as: .image(layout: Self.referenceLayout)
        )
    }
}
