import Foundation
import Combine

/// Kotlin: VenueViewModel using StateFlow; this version publishes via @Published.
final class VenueViewModel: ObservableObject {
    @Published private(set) var state: VenueUIState

    init(repository: VenueRepository = VenueRepository()) {
        state = VenueUIState(allVenues: repository.getVenues())
    }

    /// Tapping the selected mood again clears the filter, just like Kotlin.
    func selectMood(_ mood: Mood) {
        state.selectedMood = state.selectedMood == mood ? nil : mood
    }

    func toggleSave(_ venueID: String) {
        // TODO 1: deliberately a no-op, EXACTLY like the provided Kotlin starter.
        // For a completed exercise, replace this method with:
        // var newIDs = state.savedIds
        // if !newIDs.insert(venueID).inserted { newIDs.remove(venueID) }
        // state.savedIds = newIDs
        _ = venueID
    }

    func venue(_ id: String) -> Venue? {
        state.allVenues.first { $0.id == id }
    }
}
