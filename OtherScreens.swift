import SwiftUI

/// Kotlin: SanctuariesScreen in screens/OtherScreens.kt.
struct SanctuariesScreen: View {
    let state: VenueUIState
    let onToggleSave: (String) -> Void
    let onOpenVenue: (String) -> Void

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Sanctuaries")
                        .font(OvioFont.headline)
                        .foregroundStyle(OvioColors.textPrimary)
                    Text("Places you've kept for later.")
                        .font(OvioFont.bodyMedium)
                        .foregroundStyle(OvioColors.textMuted)
                    Spacer().frame(height: 16)
                }
                if state.savedVenues.isEmpty {
                    Text("Nothing saved yet. Tap the ♡ on any place.\n(If tapping does nothing, that's TODO 1!)")
                        .font(OvioFont.bodyLarge)
                        .foregroundStyle(OvioColors.textSecondary)
                }
                ForEach(state.savedVenues) { venue in
                    VenueRow(
                        venue: venue,
                        isSaved: true,
                        onToggleSave: { onToggleSave(venue.id) },
                        onOpen: { onOpenVenue(venue.id) }
                    )
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.top, 28)
            .padding(.bottom, 120)
        }
        .background(OvioColors.background.ignoresSafeArea())
        .scrollIndicators(.hidden)
    }
}

/// Kotlin: ComingSoonScreen, used on Discover, OVIO and Profile.
struct ComingSoonScreen: View {
    let title: String
    let idea: String

    var body: some View {
        ZStack {
            OvioColors.background.ignoresSafeArea()
            VStack(spacing: 0) {
                Text(title)
                    .font(OvioFont.titleLarge)
                    .foregroundStyle(OvioColors.textPrimary)
                Spacer().frame(height: 10)
                Text(idea)
                    .font(OvioFont.bodyLarge)
                    .foregroundStyle(OvioColors.textSecondary)
                    .multilineTextAlignment(.center)
                Spacer().frame(height: 14)
                Text("YOUR TURN")
                    .font(OvioFont.labelSmall)
                    .tracking(1.5)
                    .foregroundStyle(OvioColors.champagne)
            }
            .frame(maxWidth: .infinity)
            .padding(24)
            .ovioElevated(.secondary, corner: 20)
            .padding(24)
        }
    }
}
