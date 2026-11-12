import Foundation

/// Kotlin: data/Venue.kt. No UI dependencies, just the shared data contract.
enum Mood: String, CaseIterable, Hashable, Codable {
    case calm, focus, cozy

    var label: String { rawValue }

    // TODO 3, matching the Kotlin exercise: add `case reset` and tag venues.
}

struct Venue: Identifiable, Equatable {
    let id: String
    let name: String
    let category: String
    let neighborhood: String
    let distance: String
    let calmScore: Int?
    let quietWindow: String
    let whyItFits: String
    let moods: Set<Mood>
    /// The Kotlin source's setOf(...) is insertion-ordered; Swift's Set is not.
    /// Retain both set membership AND original display order for true UI parity.
    private let orderedMoods: [Mood]

    init(id: String, name: String, category: String, neighborhood: String,
         distance: String, calmScore: Int?, quietWindow: String, whyItFits: String,
         moods: [Mood]) {
        self.id = id
        self.name = name
        self.category = category
        self.neighborhood = neighborhood
        self.distance = distance
        self.calmScore = calmScore
        self.quietWindow = quietWindow
        self.whyItFits = whyItFits
        self.moods = Set(moods)
        self.orderedMoods = moods
    }

    var moodLabels: String {
        orderedMoods.map(\.label).joined(separator: " · ")
    }
}
