import Foundation

/// Kotlin: UiState in VenueViewModel.kt. Immutable value passed to SwiftUI views.
struct VenueUIState {
    var allVenues: [Venue] = []
    var selectedMood: Mood? = nil
    var savedIds: Set<String> = []

    var visibleVenues: [Venue] {
        let filtered = selectedMood.map { mood in
            allVenues.filter { $0.moods.contains(mood) }
        } ?? allVenues

        // TODO 2 (intentionally matches the original Kotlin): no sorting yet.
        // Exercise solution: sort descending by `($0.calmScore ?? -1)`.
        return filtered
    }

    var savedVenues: [Venue] {
        allVenues.filter { savedIds.contains($0.id) }
    }
}
