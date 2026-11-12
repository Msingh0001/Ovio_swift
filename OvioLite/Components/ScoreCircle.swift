import SwiftUI

/// Kotlin: components/ScoreCircle.kt. Same score colors and 1.0→1.04→1.0 breath.
struct ScoreCircle: View {
    let score: Int?
    var size: CGFloat = 56
    var breathing: Bool = false
    @State private var scale: CGFloat = 1

    private var shownScore: Int { score ?? 0 }  // TODO 4: matches starter's unknown-as-zero behavior.
    private var tint: Color { OvioColors.scoreColor(shownScore) }

    var body: some View {
        Text(String(shownScore))
            .font(.system(size: size * 0.36, weight: .semibold, design: .serif))
            .foregroundStyle(tint)
            .frame(width: size, height: size)
            .background(Circle().fill(tint.opacity(0.14)))
            .overlay { Circle().strokeBorder(tint.opacity(0.60), lineWidth: 1.5) }
            .scaleEffect(scale)
            .onAppear {
                guard breathing else { return }
                scale = 1
                withAnimation(.easeInOut(duration: 1.6).repeatForever(autoreverses: true)) {
                    scale = 1.04
                }
            }
    }
}
