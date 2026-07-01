//
//  credTests.swift
//  credTests
//
//  Created by Vikas Raj Yadav on 08/04/25.
//

import Testing
import UIKit

struct credTests {

    private static let brFirmaWeights = [
        "BRFirma-Thin",
        "BRFirma-ExtraLight",
        "BRFirma-Light",
        "BRFirma-Regular",
        "BRFirma-Medium",
        "BRFirma-SemiBold",
        "BRFirma-Bold",
        "BRFirma-Black",
    ]

    @Test func brFirmaFontsAreRegistered() async throws {
        for name in Self.brFirmaWeights {
            let font = UIFont(name: name, size: 12)
            #expect(font != nil, "Missing registered font: \(name)")
            #expect(font?.fontName == name, "Unexpected font name for \(name): \(font?.fontName ?? "nil")")
        }
    }

}
