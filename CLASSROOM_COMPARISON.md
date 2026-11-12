# Class guide — OVIO Lite in Kotlin vs Swift

## Recommended live demonstration (6–10 minutes)

1. **Show both Home screens.** Point out the same sunset forest, OVIO logo, “Find your calm.”, mood chips, featured Tea House and the five bottom tabs. Colors and app image are carried over from the source archive.
2. **Tap `focus` on both phones.** The highlighted chip and filtered result order should match: `Willow Reading Room` → `Ember & Oak` → `Northlight Studio`. Tap `focus` again to clear the filter.
3. **Open Stonebrook Garden in both.** Show its 95 score, quiet time, why-it-fits reason and breathing score circle; return with the top back button.
4. **Tap Sanctuaries.** It is empty in **both** because `toggleSave` is a TODO in the supplied Kotlin project, not because iOS is broken. Explain how state updates would fill it in automatically.
5. **Open Second Chapter Books.** Its score is `0` in both starter versions although the underlying data is `null`/`nil`. Ask why `?` would be more truthful—an excellent exercise in data ethics and product decisions.
6. **Tap Discover, OVIO, and Profile.** Each is intentionally a matching “YOUR TURN” placeholder. Compare the UI code for one of them.
7. **Show the source mapping below**, then explain why identical *behaviors* can be built with different programming languages and frameworks.

## File-for-file navigation

| Kotlin / Jetpack Compose | Swift / SwiftUI | Concept |
|---|---|---|
| `MainActivity.kt` | `OvioLiteApp.swift` | App entry |
| `data/Venue.kt` | `Model/Venue.swift` | Data model and mood enum |
| `data/VenueRepository.kt` | `Data/VenueRepository.swift` | Offline fake data |
| `ui/VenueViewModel.kt` | `Model/VenueUIState.swift` + `ViewModel/VenueViewModel.swift` | Observable state + business logic |
| `ui/OvioApp.kt` | `OvioAppView.swift` | Navigation and tabs |
| `ui/screens/HomeScreen.kt` | `Screens/HomeScreen.swift` | Home and scrollable list |
| `ui/screens/DetailScreen.kt` | `Screens/DetailScreen.swift` | Details and placeholder action |
| `ui/screens/OtherScreens.kt` | `Screens/OtherScreens.swift` | Sanctuaries / other tabs |
| `ui/components/MoodChips.kt` | `Components/MoodChips.swift` | Interactive filter chips |
| `ui/components/ScoreCircle.kt` | `Components/ScoreCircle.swift` | Animated score |
| `ui/components/VenueCard.kt` | `Components/VenueCards.swift` | Reusable cards |
| `ui/components/OvioTabBar.kt` | `Components/OvioTabBar.swift` | Custom floating navigation |
| `ui/theme/OvioColors.kt` | `Theme/OvioColors.swift` | Palette and typography |
| `ui/theme/OvioSurfaces.kt` | `Theme/OvioSurfaces.swift` | Gradients and glass surfaces |

## The six useful comparisons

| Idea | Kotlin / Compose | Swift / SwiftUI |
|---|---|---|
| Vertical layout | `Column { ... }` | `VStack { ... }` |
| Horizontal layout | `Row { ... }` | `HStack { ... }` |
| Layered background | `Box { ... }` | `ZStack { ... }` |
| Read-only model | `data class Venue(...)` | `struct Venue: Identifiable` |
| Observable screen data | `MutableStateFlow(UiState(...))` | `@Published var state: VenueUIState` |
| Read data in the screen | `collectAsStateWithLifecycle()` | `@StateObject` / `@ObservedObject` |
| Loop over venues | `LazyColumn { items(list) { ... } }` | `ScrollView { LazyVStack { ForEach(list) { ... } } }` |
| Tap event | `Modifier.clickable { ... }` | `Button { ... }` or `.onTapGesture { ... }` |
| Animation | `rememberInfiniteTransition` | `withAnimation(...repeatForever...)` |
| Optional score | `Int?`, `score ?: 0` | `Int?`, `score ?? 0` |
| Filter membership | `mood in venue.moods` | `venue.moods.contains(mood)` |
| Gradient rim | `Brush.verticalGradient` | `LinearGradient` |

### Example 1: state updates

**Kotlin**

```kotlin
fun selectMood(mood: Mood) {
    _state.update { current ->
        current.copy(selectedMood = if (current.selectedMood == mood) null else mood)
    }
}
```

**Swift**

```swift
func selectMood(_ mood: Mood) {
    state.selectedMood = state.selectedMood == mood ? nil : mood
}
```

Both toggle a filter on and off, and their UI frameworks automatically observe the resulting change.

### Example 2: unknown data

**Kotlin:** `val shownScore = score ?: 0`

**Swift:** `private var shownScore: Int { score ?? 0 }`

Both preserve the starter bug **on purpose**. The ethical fix is to show `?` with a neutral tint; this is a good conversation about why presentation logic matters.

### Example 3: why there are still separate views

Both languages use a **Model → Repository → ViewModel → View** design. The view is a function of its state. A mood filter changes the state; the framework redraws the UI. That separation keeps the same data and behaviors portable between native platforms even though Compose and SwiftUI use different syntax.

## Parity test plan

- **At launch:** eight venues, The Paper Lantern is hero with score 92.
- **Calm chip:** Paper Lantern, Willow Reading Room, Stonebrook Garden, Cedar Hollow Park, Second Chapter Books (same order).
- **Focus chip:** Willow Reading Room, Ember & Oak, Northlight Studio.
- **Cozy chip:** Paper Lantern, Ember & Oak, Little Fig Bistro, Second Chapter Books.
- **Open bookshop:** displays `0` (until TODO 4 is completed on *both* apps).
- **Tap save:** no state change (until TODO 1 is completed on *both* apps).
- **Other tabs:** same placeholders and copy.
- **Directions:** shows placeholder feedback instead of opening maps.

## Notes for the speaker

- This is not a Kotlin/Swift compiler or a shared-code app: two separate native projects produce the same app design.
- It is not a production OVIO connection: the repository contains fictional places, and the `index.html` prototype included in the Android ZIP is outside the Kotlin starter's app logic.
- The exact same custom wallpaper image is included in both platforms; Swift uses the iOS New York serif and SF Symbols in place of the OS-specific Android serif and Material icons, so expect minor differences between devices.
