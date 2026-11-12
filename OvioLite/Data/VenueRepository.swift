import Foundation

/// Kotlin: data/VenueRepository.kt. These eight fictional venues are EXACTLY the same.
/// The starter is offline and does not use OVIO's real API or a device location.
struct VenueRepository {
    func getVenues() -> [Venue] { Self.venues }

    private static let venues: [Venue] = [
        Venue(
            id: "lantern", name: "The Paper Lantern", category: "Tea house",
            neighborhood: "Hillcrest", distance: "0.6 mi", calmScore: 92,
            quietWindow: "Quietest 2–4 PM",
            whyItFits: "Low lighting, soft music, and tables spaced far apart.",
            moods: [.calm, .cozy]
        ),
        Venue(
            id: "reading-room", name: "Willow Reading Room", category: "Library",
            neighborhood: "The Heights", distance: "1.2 mi", calmScore: 88,
            quietWindow: "Quietest after 6 PM",
            whyItFits: "Silent floor upstairs, with outlets at every desk.",
            moods: [.calm, .focus]
        ),
        Venue(
            id: "ember", name: "Ember & Oak", category: "Coffee shop",
            neighborhood: "SoMa", distance: "0.9 mi", calmScore: 64,
            quietWindow: "Calmer before 9 AM",
            whyItFits: "A fireplace corner that most people walk right past.",
            moods: [.cozy, .focus]
        ),
        Venue(
            id: "cowork", name: "Northlight Studio", category: "Coworking",
            neighborhood: "River Market", distance: "1.8 mi", calmScore: 71,
            quietWindow: "Quietest Tue–Thu mornings",
            whyItFits: "Phone booths keep calls out of the main room.",
            moods: [.focus]
        ),
        Venue(
            id: "garden", name: "Stonebrook Garden", category: "Garden",
            neighborhood: "Riverdale", distance: "2.4 mi", calmScore: 95,
            quietWindow: "Empty most weekday mornings",
            whyItFits: "A shaded path with benches facing the water.",
            moods: [.calm]
        ),
        Venue(
            id: "park", name: "Cedar Hollow Park", category: "Park",
            neighborhood: "West Little Rock", distance: "3.1 mi", calmScore: 81,
            quietWindow: "Quietest at sunrise",
            whyItFits: "A loop trail through the trees, with very little foot traffic.",
            moods: [.calm]
        ),
        Venue(
            id: "bistro", name: "Little Fig Bistro", category: "Small bistro",
            neighborhood: "Hillcrest", distance: "0.7 mi", calmScore: 47,
            quietWindow: "Calmer before 6 PM",
            whyItFits: "Booths along the back wall feel private even when it's full.",
            moods: [.cozy]
        ),
        Venue(
            id: "bookshop", name: "Second Chapter Books", category: "Bookstore",
            neighborhood: "The Heights", distance: "1.1 mi", calmScore: nil,
            quietWindow: "Not enough data yet",
            whyItFits: "Reading chairs tucked between the shelves.",
            moods: [.calm, .cozy]
        )
    ]
}
