import SwiftUI

/// Kotlin: components/MoodChips.kt. Adding a new Mood automatically adds a new chip.
struct MoodChips: View {
    let selected: Mood?
    let onSelect: (Mood) -> Void

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(Mood.allCases, id: \.self) { mood in
                    let active = selected == mood
                    Button {
                        onSelect(mood)
                    } label: {
                        Text(mood.label)
                            .font(OvioFont.labelLarge)
                            .foregroundStyle(active ? OvioColors.warmIvory : OvioColors.textSecondary)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 9)
                            .background {
                                Capsule().fill(active ? OvioColors.accent.opacity(0.18) : .black.opacity(0.35))
                            }
                            .overlay {
                                Capsule().strokeBorder(
                                    active ? OvioColors.champagne.opacity(0.70) : .white.opacity(0.14),
                                    lineWidth: active ? 1 : 0.5
                                )
                            }
                    }
                    .buttonStyle(.plain)
                    .accessibilityAddTraits(active ? [.isSelected] : [])
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}
