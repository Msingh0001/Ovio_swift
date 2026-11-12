# OVIO Lite — SwiftUI / iOS port

**A complete native SwiftUI translation of the supplied Kotlin + Jetpack Compose `OvioLite-master` classroom starter** (snapshot dated October 22, 2026).

The goal is to put the two source trees side by side in class: **same sample content, same colors, same layouts and dimensions, same navigation and the same deliberately unfinished exercises**. This is **not** the full commercial OVIO application, backend, or the unrelated `index.html` prototype in the Android archive.

## Run in Xcode

1. On a **Mac**, install Xcode 16 or newer, including the iOS simulator runtime.
2. Unzip this archive. Double-click **`OvioLite.xcodeproj`** (the project, not an individual `.swift` file).
3. Select the shared scheme **OvioLite** and an iPhone simulator (e.g., iPhone 16 / iOS 18 or later).
4. Press **⌘R** or the ▶ Run button. No API keys, location permission, backend, or internet access needed for the app itself.
5. For a physical iPhone, select your Apple developer signing team in **Signing & Capabilities** if Xcode requests one.

**Requirements:** iOS 17+, Xcode 16+. An iOS build and simulator require macOS/Xcode; neither is available in this Linux build environment. Swift syntax and the platform-neutral model/state behavior have been checked, but the iOS UI has not been compiled or visually compared on an Apple simulator here.

## What is ported

- Original forest wallpaper, launcher artwork, gold/espresso colors, gradient and glass-card styling.
- Serif type hierarchy, floating five-tab navigation capsule, custom hand-drawn concierge bell.
- Home screen with OVIO wordmark, hero pick, mood chips, remaining venue rows, score circles and breathing animation.
- Eight **identical** fake venues with the same text, scores, distances, neighborhood, mood tags and list ordering.
- Mood chip filtering (tap again to clear), detail navigation, detail cards, and back button.
- Sanctuaries, Discover, OVIO Concierge, and Profile **in the same starter state** as Android.
- Same MVVM separation: `Venue` → `VenueRepository` → `VenueViewModel`/`VenueUIState` → views.

## Important: deliberate parity with unfinished Kotlin TODOs

The original **Android app intentionally has five teaching exercises**, so the port **does not silently solve them**. In both starter apps:

| Exercise | Current matching behavior | Swift location |
|---|---|---|
| TODO 1 — Save hearts | Heart button does not change state; Sanctuaries remains empty | `ViewModel/VenueViewModel.swift` |
| TODO 2 — Sorting | Venues remain in repository order, not calm-score order | `Model/VenueUIState.swift` |
| TODO 3 — New mood | Only `calm`, `focus`, `cozy` exist | `Model/Venue.swift`, `Data/VenueRepository.swift` |
| TODO 4 — Missing score | `nil` score displays **0** (the bug students are meant to fix) | `Components/ScoreCircle.swift` |
| TODO 5 — Directions | “Take me there” shows a placeholder message, not maps | `Screens/DetailScreen.swift` |

This is an exact **behavioral** match to the provided starter, not a claim that all future exercises are implemented. If you complete any TODO in Kotlin during the presentation, update the matching Swift TODO to retain parity.

## Platform differences

Android's default `FontFamily.Serif` and iOS's `.serif` fonts are not identical font files; platform SF Symbols differ slightly from Material icons. Safe area, status bar, touch feedback and line breaking can also vary between phones. Colors, artwork, scoring, content, view hierarchy and key spacings are ported as closely as native frameworks allow. For **pixel-by-pixel** matching, compare captures from a specific iPhone and Android phone at the same logical width and make device-specific typographic adjustments.

## Compare sources in class

Read [`CLASSROOM_COMPARISON.md`](CLASSROOM_COMPARISON.md) for an explanation of Kotlin↔Swift language features, the map of equivalent files, and a quick live-demo script.

### Run the portable data/state verification

From this folder on any computer with a Swift compiler:

```bash
swiftc -o ovio-model-check \
    OvioLite/Model/Venue.swift \
    OvioLite/Model/VenueUIState.swift \
    OvioLite/Data/VenueRepository.swift \
    Checks/main.swift
./ovio-model-check
```

This runs exact-order and mood-filter checks independently of SwiftUI. An actual iOS app build still needs Xcode.
