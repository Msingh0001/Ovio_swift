import SwiftUI

/// Kotlin: OvioTab in components/OvioTabBar.kt. Same order and labels.
enum OvioTab: String, CaseIterable, Hashable {
    case home = "Home"
    case discover = "Discover"
    case concierge = "OVIO"
    case sanctuaries = "Sanctuaries"
    case profile = "Profile"

    var symbol: String? {
        switch self {
        case .home: return "house"
        case .discover: return "magnifyingglass"
        case .concierge: return nil
        case .sanctuaries: return "heart"
        case .profile: return "person"
        }
    }
}

/// Floating tab bar capsule, copied from Compose dimensions and coloring.
struct OvioTabBar: View {
    let selected: OvioTab
    let onSelect: (OvioTab) -> Void

    var body: some View {
        HStack(spacing: 0) {
            ForEach(OvioTab.allCases, id: \.self) { tab in
                let active = tab == selected
                let tint = active ? OvioColors.champagne : Color(hex: 0xB8B0A3).opacity(0.62)
                Button {
                    onSelect(tab)
                } label: {
                    VStack(spacing: 4) {
                        if let symbol = tab.symbol {
                            Image(systemName: symbol)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 19, height: 19)
                                .foregroundStyle(tint)
                        } else {
                            ConciergeBell(color: tint).frame(width: 19, height: 19)
                        }
                        Text(tab.rawValue)
                            .font(.system(size: 9.5, weight: .medium, design: .serif))
                            .foregroundStyle(active ? OvioColors.champagne : .white.opacity(0.46))
                            .lineLimit(1)
                            .minimumScaleFactor(0.85)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 61)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .accessibilityAddTraits(active ? [.isSelected] : [])
            }
        }
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 30).fill(OvioColors.tabBar))
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .strokeBorder(.white.opacity(0.075), lineWidth: 0.7)
        }
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

/// Direct translation of the Compose Canvas concierge bell path.
private struct ConciergeBell: View {
    let color: Color

    var body: some View {
        GeometryReader { proxy in
            let w = proxy.size.width
            let h = proxy.size.height
            ZStack {
                Circle()
                    .strokeBorder(color, lineWidth: 1.2)
                    .frame(width: w * 0.14, height: w * 0.14)
                    .position(x: w * 0.5, y: h * 0.15)
                Path { path in
                    path.move(to: CGPoint(x: w * 0.17, y: h * 0.68))
                    path.addQuadCurve(
                        to: CGPoint(x: w * 0.83, y: h * 0.68),
                        control: CGPoint(x: w * 0.50, y: h * 0.22)
                    )
                    path.move(to: CGPoint(x: w * 0.12, y: h * 0.70))
                    path.addLine(to: CGPoint(x: w * 0.88, y: h * 0.70))
                    path.move(to: CGPoint(x: w * 0.05, y: h * 0.87))
                    path.addLine(to: CGPoint(x: w * 0.95, y: h * 0.87))
                }
                .stroke(color, style: StrokeStyle(lineWidth: 1.2, lineCap: .round))
            }
        }
        .accessibilityHidden(true)
    }
}
