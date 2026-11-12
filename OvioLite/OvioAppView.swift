import SwiftUI

/// Kotlin: ui/OvioApp.kt. Owns tabs + the currently opened venue, not venue data.
struct OvioAppView: View {
    @StateObject private var viewModel = VenueViewModel()
    @State private var selectedTab: OvioTab = .home
    @State private var openVenueID: String? = nil

    private var screenKey: String { "\(selectedTab.rawValue):\(openVenueID ?? "list")" }

    var body: some View {
        ZStack {
            OvioColors.background.ignoresSafeArea()
            Group {
                if let openVenueID, let venue = viewModel.venue(openVenueID) {
                    DetailScreen(
                        venue: venue,
                        isSaved: viewModel.state.savedIds.contains(venue.id),
                        onToggleSave: { viewModel.toggleSave(venue.id) },
                        onBack: { openVenueIDBack() }
                    )
                } else {
                    switch selectedTab {
                    case .home:
                        HomeScreen(
                            state: viewModel.state,
                            onSelectMood: viewModel.selectMood,
                            onToggleSave: viewModel.toggleSave,
                            onOpenVenue: openVenue
                        )
                    case .sanctuaries:
                        SanctuariesScreen(
                            state: viewModel.state,
                            onToggleSave: viewModel.toggleSave,
                            onOpenVenue: openVenue
                        )
                    case .discover:
                        ComingSoonScreen(
                            title: "Discover",
                            idea: "Browse every place on a map or in a grid. Try a LazyVerticalGrid!"
                        )
                    case .concierge:
                        ComingSoonScreen(
                            title: "OVIO Concierge",
                            idea: "In the real app, you type what you need and an AI plans a calm outing for you."
                        )
                    case .profile:
                        ComingSoonScreen(
                            title: "Profile",
                            idea: "Let users pick their favourite moods, and show those first on Home."
                        )
                    }
                }
            }
            .id(screenKey)
            .transition(.opacity)
            .animation(.easeInOut(duration: 0.22), value: screenKey)
        }
        .overlay(alignment: .bottom) {
            OvioTabBar(selected: selectedTab) { tab in
                selectedTab = tab
                openVenueID = nil
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 12)
        }
    }

    private func openVenue(_ id: String) { openVenueID = id }
    private func openVenueIDBack() { openVenueID = nil }
}
