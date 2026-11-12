import Foundation

// Portable model/data/state checks; run on macOS or Linux with Swift installed.
// These intentionally verify the original Android STARTER behavior, not the TODO solutions.
let all = VenueRepository().getVenues()
assert(all.count == 8, "Expected exactly eight Android sample venues")
assert(all.map(\.id) == ["lantern", "reading-room", "ember", "cowork", "garden", "park", "bistro", "bookshop"])
assert(all.first?.name == "The Paper Lantern")
assert(all[4].calmScore == 95)
assert(all.last?.calmScore == nil)
assert(all.last?.moodLabels == "calm · cozy")
assert(all[2].moodLabels == "cozy · focus", "Kotlin setOf insertion order must survive Swift translation")

var state = VenueUIState(allVenues: all)
assert(state.visibleVenues == all, "Original Kotlin is deliberately unsorted")
assert(state.savedVenues.isEmpty, "No default saved venues")
state.selectedMood = .calm
assert(state.visibleVenues.map(\.id) == ["lantern", "reading-room", "garden", "park", "bookshop"])
state.selectedMood = .focus
assert(state.visibleVenues.map(\.id) == ["reading-room", "ember", "cowork"])
state.selectedMood = .cozy
assert(state.visibleVenues.map(\.id) == ["lantern", "ember", "bistro", "bookshop"])
state.selectedMood = nil
assert(state.visibleVenues == all)
print("PASS: 8 venues, exact order, nil score, mood filters, and state-derived lists")
