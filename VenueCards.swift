import SwiftUI

/// Kotlin: components/VenueCard.kt.
struct HeroVenueCard: View {
    let venue: Venue
    let isSaved: Bool
    let onToggleSave: () -> Void
    let onOpen: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 12) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(venue.category.uppercased())
                        .font(OvioFont.labelSmall)
                        .tracking(1.5)
                        .foregroundStyle(OvioColors.champagne.opacity(0.85))
                    Spacer().frame(height: 6)
                    Text(venue.name)
                        .font(OvioFont.titleLarge)
                        .foregroundStyle(OvioColors.textPrimary)
                    Spacer().frame(height: 4)
                    Text("\(venue.neighborhood) · \(venue.distance)")
                        .font(OvioFont.bodyMedium)
                        .foregroundStyle(OvioColors.textMuted)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                ScoreCircle(score: venue.calmScore, size: 64, breathing: true)
            }
            Spacer().frame(height: 14)
            Text(venue.whyItFits)
                .font(OvioFont.bodyLarge)
                .lineSpacing(3)
                .foregroundStyle(OvioColors.textBody)
            Spacer().frame(height: 6)
            Text(venue.quietWindow)
                .font(OvioFont.bodyMedium)
                .foregroundStyle(OvioColors.champagne)
            Spacer().frame(height: 10)
            Rectangle().fill(.white.opacity(0.08)).frame(height: 0.5)
            HStack(spacing: 0) {
                Text("Why it fits")
                    .font(OvioFont.bodyMedium)
                    .foregroundStyle(OvioColors.warmIvory.opacity(0.86))
                Spacer(minLength: 0)
                SaveButton(isSaved: isSaved, onToggle: onToggleSave)
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundStyle(OvioColors.champagne.opacity(0.62))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .ovioElevated(.primary, corner: 20)
        .contentShape(RoundedRectangle(cornerRadius: 20))
        .onTapGesture(perform: onOpen)
        .accessibilityElement(children: .contain)
    }
}

struct VenueRow: View {
    let venue: Venue
    let isSaved: Bool
    let onToggleSave: () -> Void
    let onOpen: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            ScoreCircle(score: venue.calmScore, size: 46)
            VStack(alignment: .leading, spacing: 2) {
                Text(venue.name)
                    .font(OvioFont.titleMedium)
                    .foregroundStyle(OvioColors.textPrimary)
                    .lineLimit(1)
                Text("\(venue.category) · \(venue.distance)")
                    .font(OvioFont.bodyMedium)
                    .foregroundStyle(OvioColors.textMuted)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            SaveButton(isSaved: isSaved, onToggle: onToggleSave)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .ovioSurface(corner: 16)
        .contentShape(RoundedRectangle(cornerRadius: 16))
        .onTapGesture(perform: onOpen)
    }
}

struct SaveButton: View {
    let isSaved: Bool
    let onToggle: () -> Void

    var body: some View {
        Button(action: onToggle) {
            Image(systemName: isSaved ? "heart.fill" : "heart")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(isSaved ? OvioColors.champagne : OvioColors.textFaint)
                .frame(width: 48, height: 48)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(isSaved ? "Remove from sanctuaries" : "Save to sanctuaries")
    }
}

struct SectionLabel: View {
    let text: String

    var body: some View {
        HStack(spacing: 10) {
            Text(text.uppercased())
                .font(OvioFont.labelSmall)
                .tracking(1.5)
                .foregroundStyle(OvioColors.champagne.opacity(0.8))
            Rectangle()
                .fill(OvioColors.bronze.opacity(0.35))
                .frame(height: 0.5)
        }
    }
}
