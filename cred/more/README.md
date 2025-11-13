# More View - Content Management Guide

## How to Update Content

### 1. **Update Menu Items** (`MenuData.swift`)

Simply edit the arrays in `MenuData.swift`:

```swift
static let popularItems: [MenuItem] = [
    MenuItem(
        icon: .sfSymbol("creditcard.fill"),  // SF Symbol name
        title: "Cards",                      // Main text
        subtitle: "Manage"                   // Optional subtitle
    ),
    // Add more items...
]
```

### 2. **Icon Types**

You can use three types of icons:

- **SF Symbols** (recommended): `.sfSymbol("creditcard.fill")`
- **Custom Images**: `.image("your-image-name")` (from Assets.xcassets)
- **System Images**: `.system("system-image-name")`

### 3. **Adding Navigation**

For items that need navigation, use `MenuDataWithRouter`:

```swift
let menuData = MenuData.createItems(with: router)
MenuGrid(items: menuData.popularItemsWithActions)
```

### 4. **File Structure**

```
more/
├── Models/
│   └── MenuItem.swift          # Data model
├── Components/
│   ├── MenuItemView.swift      # Single item component
│   ├── MenuGrid.swift          # 4-item grid component
│   └── SectionHeader.swift    # Section title component
├── Data/
│   └── MenuData.swift          # All your content data
└── moreView.swift              # Main view
```

### 5. **Quick Example**

To add a new item:
1. Open `MenuData.swift`
2. Add to the appropriate array:
```swift
MenuItem(
    icon: .sfSymbol("star.fill"),
    title: "Favorites",
    subtitle: "Saved"
)
```

That's it! The UI will automatically update.

