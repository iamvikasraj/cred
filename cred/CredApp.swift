//
//  CredApp.swift
//  cred
//
//  Created by Vikas Raj Yadav on 08/04/25.
//

import SwiftUI

@main
struct CredApp: App {
    init() {
        AppSansFont.configureAppearance()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
