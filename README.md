# OVIO Lite: iPhone (Swift) version

This is the **Swift + SwiftUI** twin of the OVIO Lite Android starter you already know.
It is the same small app from the guest lecture "One app. Two languages.": same eight calm places, same colors, same screens.

Use it to compare. Open a Kotlin file and its Swift twin side by side, and see how the same idea is written in two languages.

- ✅ Runs offline: no internet, no API keys, no accounts
- ✅ Same plan as the Android version: **Model → Repository → ViewModel → Screens** (MVVM)
- ✅ Same five exercises, waiting for you

> **No Mac?** You can still read every file right here on GitHub. You only need a Mac to *run* the app.

---

## 1. Run it (on a Mac)

1. Install **Xcode 16 or newer** from the Mac App Store.
2. Download this project (green **Code** button, then **Download ZIP**) and unzip it.
3. Double-click **`OvioLite.xcodeproj`**.
4. At the top of Xcode, pick an iPhone simulator (for example, *iPhone 16*).
5. Press the **▶ Run** button, or **⌘R**.

You should see the OVIO home screen with a mountain wallpaper, mood chips, and a list of calm places.

---

## 2. Find your way around

```
OvioLite/
├── OvioLiteApp.swift          ← the app starts here (like MainActivity.kt)
├── OvioAppView.swift          ← tabs + which screen is showing
├── Model/
│   ├── Venue.swift            ← the data model + Mood enum
│   └── VenueUIState.swift     ← the screen's information
├── Data/
│   └── VenueRepository.swift  ← the eight fake places
├── ViewModel/
│   └── VenueViewModel.swift   ← the brain: functions that change the state
├── Screens/                   ← Home, Detail, and the other tabs
├── Components/                ← ScoreCircle, MoodChips, VenueCards, OvioTabBar
├── Theme/                     ← colors and the "glass" look
└── Assets.xcassets/           ← the wallpaper and app icon
```

**The one idea to understand:** the screen never changes the data itself. It asks the ViewModel.

```
You tap focus  →  viewModel.selectMood(.focus)  →  new state  →  SwiftUI redraws by itself
```

---

## 3. Kotlin file → Swift file

| Android (Kotlin) | iPhone (Swift) |
|---|---|
| `MainActivity.kt` + `ui/theme/OvioTheme.kt` | `OvioLiteApp.swift` |
| `ui/OvioApp.kt` | `OvioAppView.swift` |
| `data/Venue.kt` | `Model/Venue.swift` |
| `data/VenueRepository.kt` | `Data/VenueRepository.swift` |
| `ui/VenueViewModel.kt` | `Model/VenueUIState.swift` + `ViewModel/VenueViewModel.swift` |
| `ui/screens/HomeScreen.kt` | `Screens/HomeScreen.swift` |
| `ui/screens/DetailScreen.kt` | `Screens/DetailScreen.swift` |
| `ui/components/MoodChips.kt` | `Components/MoodChips.swift` |
| `ui/components/ScoreCircle.kt` | `Components/ScoreCircle.swift` |
| `ui/components/VenueCard.kt` | `Components/VenueCards.swift` |

Notice that the files do not line up one for one. One Kotlin file became two Swift files, and two Kotlin files became one. Translating code is like translating a joke: you keep the meaning, not the words.

---

## 4. Kotlin ↔ Swift cheat sheet

| The idea | Kotlin | Swift |
|---|---|---|
| Written in pen (never changes) | `val` | `let` |
| Written in pencil (can change) | `var` | `var` |
| A labeled box | `data class` | `struct` |
| Empty | `null` | `nil` |
| If it is empty, use this instead | `score ?: 0` | `score ?? 0` |
| A function | `fun` | `func` |
| Pick the line that matches | `when (score)` | `switch score` |
| A range of numbers | `90..100` | `90...100` |
| Stack things top to bottom | `Column { }` | `VStack { }` |
| Put things side by side | `Row { }` | `HStack { }` |
| Layer things like paper | `Box { }` | `ZStack { }` |
| A piece of screen | `@Composable fun Home()` | `struct Home: View` |

---

## 5. Your exercises

These are the same five TODOs as in the Android project. In Xcode, press **⌘⇧F** and search for `TODO` to jump to each one.

| # | File | What to do | Difficulty |
|---|------|------------|------------|
| 1 | `ViewModel/VenueViewModel.swift` | Make the ♡ save button work. Then check the Sanctuaries tab. | ⭐ |
| 2 | `Model/VenueUIState.swift` | Sort places so the calmest comes first. | ⭐ |
| 3 | `Model/Venue.swift` + `Data/VenueRepository.swift` | Add a new mood, **reset**, and tag some places with it. | ⭐⭐ |
| 4 | `Components/ScoreCircle.swift` | **Honest scores:** show `?` instead of `0` when there is no data. | ⭐⭐ |
| 5 | `Screens/DetailScreen.swift` | *(Stretch)* Make "Take me there" open Maps. | ⭐⭐⭐ |

**A good way to practice:** solve a TODO in Kotlin first, then solve the same one here in Swift. You will see how much carries over.

---

## 6. Why TODO 4 matters

Look at *Second Chapter Books*. There is **no crowd data** for it, so its `calmScore` is `nil`.
Right now the app shows **0**, which tells people the place is packed. That is not true.

OVIO's rule: **showing "?" is better than a made-up number.**
The code runs with no errors in both Kotlin and Swift. The computer checks your spelling. Only you can check the truth.

---

## 7. Small differences you may notice

The two apps will not look pixel for pixel the same. iPhone and Android use different fonts and different icon sets, so text and icons look slightly different. The content, colors, layout and behavior are the same.
