import SwiftUI

/// Kotlin: screens/DetailScreen.kt. Navigation and placeholder directions match.
struct DetailScreen: View {
    let venue: Venue
    let isSaved: Bool
    let onToggleSave: () -> Void
    let onBack: () -> Void
    @State private var showDirectionsToast = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [OvioColors.background, OvioColors.ground],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        Button(action: onBack) {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 22))
                                .foregroundStyle(OvioColors.champagne)
                                .frame(width: 48, height: 48)
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("Back")
                        Spacer()
                        SaveButton(isSaved: isSaved, onToggle: onToggleSave)
                    }
                    Spacer().frame(height: 12)
                    Text(venue.category.uppercased())
                        .font(OvioFont.labelSmall)
                        .tracking(1.5)
                        .foregroundStyle(OvioColors.champagne)
                        .frame(maxWidth: .infinity)
                    Spacer().frame(height: 8)
                    Text(venue.name)
                        .font(OvioFont.headline)
                        .foregroundStyle(OvioColors.textPrimary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                    Text("\(venue.neighborhood) · \(venue.distance)")
                        .font(OvioFont.bodyMedium)
                        .foregroundStyle(OvioColors.textMuted)
                        .frame(maxWidth: .infinity)
                    Spacer().frame(height: 28)
                    ScoreCircle(score: venue.calmScore, size: 120, breathing: true)
                    Spacer().frame(height: 10)
                    Text("CALM SCORE")
                        .font(OvioFont.labelSmall)
                        .tracking(1.5)
                        .foregroundStyle(OvioColors.textFaint)
                    Spacer().frame(height: 30)
                    InfoCard(title: "Why it fits", bodyText: venue.whyItFits)
                    Spacer().frame(height: 12)
                    InfoCard(title: "Calmest time", bodyText: venue.quietWindow)
                    Spacer().frame(height: 12)
                    InfoCard(title: "Good for", bodyText: venue.moodLabels)
                    Spacer().frame(height: 28)
                    Button {
                        // TODO 5: just like Kotlin, this does not open maps yet.
                        // Swift counterpart: use `openURL` with a maps URL.
                        showDirectionsToast = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                            showDirectionsToast = false
                        }
                    } label: {
                        Text("Take me there")
                            .font(OvioFont.titleMedium)
                            .foregroundStyle(OvioColors.warmIvory)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .ovioPrimaryAction()
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 120)
            }
            .scrollIndicators(.hidden)
        }
        .overlay(alignment: .bottom) {
            if showDirectionsToast {
                Text("Directions are your job: see TODO 5")
                    .font(OvioFont.bodyMedium)
                    .foregroundStyle(OvioColors.textPrimary)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 12)
                    .background(Capsule().fill(OvioColors.tabBar))
                    .overlay(Capsule().strokeBorder(OvioColors.bronze.opacity(0.5)))
                    .padding(.bottom, 93)
                    .transition(.opacity)
                    .allowsHitTesting(false)
            }
        }
        .animation(.easeInOut(duration: 0.2), value: showDirectionsToast)
        .simultaneousGesture(
            DragGesture(minimumDistance: 30).onEnded { value in
                if value.startLocation.x < 35 && value.translation.width > 80 && abs(value.translation.height) < 60 {
                    onBack()
                }
            }
        )
    }
}

private struct InfoCard: View {
    let title: String
    let bodyText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            SectionLabel(text: title)
            Text(bodyText)
                .font(OvioFont.bodyLarge)
                .foregroundStyle(OvioColors.textBody)
                .lineSpacing(3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .ovioSurface()
    }

}
