# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**cred** is a SwiftUI iOS app (CRED clone) targeting iOS 18.4+, Swift 5, bundle ID `shoonya.cred`. It uses Xcode's file-system-synchronized groups (objectVersion 77) — no manual file-reference management needed.

## Build & Run

```bash
# Build
xcodebuild -project cred.xcodeproj -scheme cred -sdk iphonesimulator build

# Run tests
xcodebuild -project cred.xcodeproj -scheme cred -sdk iphonesimulator test

# Run a single test
xcodebuild -project cred.xcodeproj -scheme cred -sdk iphonesimulator \
  -only-testing:credTests/TestClassName/testMethodName test
```

Open `cred.xcodeproj` in Xcode for simulator runs and SwiftUI previews.

## Dependencies

Single SPM dependency: **RiveRuntime** (`rive-ios`) — used for the animated tab bar (`cred.riv` state machine).

## Architecture

### App Entry & Navigation

`CredApp` → `MainView` (in `ContentView.swift`). MainView owns:
- A `NavigationStack` with path-based routing via `AppRouter` (ObservableObject).
- A `Tab` enum (`home`, `cards`, `scan`, `rewards`, `more`) driving `TabContent`.
- A `CustomTabBar` rendered via a Rive animation (`cred.riv`, state machine `"nav"`). Tab selection sets boolean inputs matching each `Tab.rawValue`.

`AppRouter` holds a `NavigationPath` and exposes `navigate(to:)`, `goBack()`, `navigateToRoot()`. The `Route` enum defines all deep-link destinations. The `.withRouter()` view modifier wires up `navigationDestination(for: Route.self)`.

### Screen Pattern

Each tab screen (`HomeView`, `cardView`, `rewards`, `scanView`, `more`) follows the same shell: `ZStack` with `Color.black` background → `GeometryReader` → `ScrollView` inside a white `RoundedRectangle(cornerRadius: 20)` clipped container, with `.ignoresSafeArea(.container, edges: .all)` and bottom padding for the tab bar.

### Typography

Two font systems coexist:
- **`AppSansFont`** — SF Rounded (system). Currently used in HomeView and general UI. Intended as a temporary stand-in.
- **`NeoPOPFont`** — Custom Gilroy + PPCirka fonts loaded via `CredFonts.plist` (UIAppFonts). Font files in `Resources/Fonts/`. Use `NeoPOPFont.gilroy(size:weight:)` or `.cirka(size:weight:)`.

### More Tab Structure

The `more` view uses a component-based pattern: `MenuItem` model → `MenuData` factory (creates items with router actions) → `MenuGrid` / `MenuItemView` / `SectionHeader` components. Sub-views (Settings, Profile, Wallet, etc.) live in `more/Views/`.

## Conventions

- View files for tab screens use lowercase struct names (`cardView`, `rewards`, `scanView`, `more`) — match existing casing when adding features.
- Figma references are embedded as doc comments with node links (e.g., `/// [Figma 1546:1061](...)`).
- Colors are defined inline as `Color(red:green:blue:)` literals, not in a centralized palette.
