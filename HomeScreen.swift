import SwiftUI

/// Kotlin: screens/HomeScreen.kt. Same wallpaper, scrim, vertical rhythm, and cards.
struct HomeScreen: View {
    let state: VenueUIState
    let onSelectMood: (Mood) -> Void
    let onToggleSave: (String) -> Void
    let onOpenVenue: (String) -> Void

    var body: some View {
        let venues = state.visibleVenues
        ZStack {
            GeometryReader { geometry in
                Image("wallpaper_forest")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .ignoresSafeArea()
            }
            LinearGradient(
                stops: [
                    .init(color: .black.opacity(0.10), location: 0),
                    .init(color: OvioColors.ground.opacity(0.45), location: 0.35),
                    .init(color: OvioColors.ground.opacity(0.85), location: 0.65),
                    .init(color: OvioColors.ground, location: 1)
                ], startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    Text("OVIO")
                        .font(OvioFont.wordmark)
                        .tracking(12)
                        .foregroundStyle(OvioColors.wordmark)
                        .shadow(color: .black.opacity(0.5), radius: 11)
                        .frame(maxWidth: .infinity)
                    Spacer().frame(height: 6)
                    Text("Find your calm.")
                        .font(OvioFont.headline)
                        .foregroundStyle(OvioColors.warmIvory)
                        .shadow(color: .black.opacity(0.55), radius: 13)
                        .frame(maxWidth: .infinity)
                    Spacer().frame(height: 140)
                    MoodChips(selected: state.selectedMood, onSelect: onSelectMood)
                    Spacer().frame(height: 22)

                    if let hero = venues.first {
                        SectionLabel(text: state.selectedMood.map { "Best for \($0.label)" } ?? "Tonight's pick")
                        Spacer().frame(height: 12)
                        HeroVenueCard(
                            venue: hero,
                            isSaved: state.savedIds.contains(hero.id),
                            onToggleSave: { onToggleSave(hero.id) },
                            onOpen: { onOpenVenue(hero.id) }
                        )
                        Spacer().frame(height: 26)
                        if venues.count > 1 {
                            SectionLabel(text: "More calm spots")
                            Spacer().frame(height: 12)
                        }
                        ForEach(venues.dropFirst()) { venue in
                            VenueRow(
                                venue: venue,
                                isSaved: state.savedIds.contains(venue.id),
                                onToggleSave: { onToggleSave(venue.id) },
                                onOpen: { onOpenVenue(venue.id) }
                            )
                            .padding(.bottom, 10)
                        }
                    } else {
                        Text("Nothing matches that mood yet.")
                            .font(OvioFont.bodyLarge)
                            .foregroundStyle(OvioColors.textSecondary)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 28)
                .padding(.bottom, 120)
            }
            .scrollIndicators(.hidden)
        }
    }
}
