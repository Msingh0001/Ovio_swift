import SwiftUI

/// Kotlin: OvioSurfaces.kt; the same dark well, fine metallic rim, and warm glow.
enum OvioElevation { case primary, secondary, quiet }

private enum OvioSurfacePaint {
    static let well = LinearGradient(
        stops: [
            .init(color: Color(hex: 0x1B1610), location: 0),
            .init(color: Color(hex: 0x100D0A), location: 0.42),
            .init(color: Color(hex: 0x080605), location: 1)
        ], startPoint: .top, endPoint: .bottom
    )

    static func rim(_ elevation: OvioElevation) -> LinearGradient {
        let stops: [Gradient.Stop]
        switch elevation {
        case .primary:
            stops = [
                .init(color: Color(hex: 0xFFE6B3).opacity(0.95), location: 0),
                .init(color: Color(hex: 0xDBB880).opacity(0.66), location: 0.10),
                .init(color: OvioColors.bronze.opacity(0.34), location: 0.44),
                .init(color: Color(hex: 0x75542B).opacity(0.58), location: 1)
            ]
        case .secondary:
            stops = [
                .init(color: Color(hex: 0xFFE6B3).opacity(0.42), location: 0),
                .init(color: Color(hex: 0xDBB880).opacity(0.28), location: 0.14),
                .init(color: OvioColors.bronze.opacity(0.15), location: 0.50),
                .init(color: Color(hex: 0x75542B).opacity(0.22), location: 1)
            ]
        case .quiet:
            stops = [
                .init(color: .white.opacity(0.10), location: 0),
                .init(color: .white.opacity(0.05), location: 0.50),
                .init(color: .white.opacity(0.03), location: 1)
            ]
        }
        return LinearGradient(stops: stops, startPoint: .top, endPoint: .bottom)
    }
}

private struct OvioSurface: ViewModifier {
    var corner: CGFloat = 16
    var fill: Double = 0.06
    var stroke: Double = 0.08

    func body(content: Content) -> some View {
        content
            .background(RoundedRectangle(cornerRadius: corner).fill(.white.opacity(fill)))
            .overlay {
                RoundedRectangle(cornerRadius: corner)
                    .strokeBorder(.white.opacity(stroke), lineWidth: 0.5)
            }
            .clipShape(RoundedRectangle(cornerRadius: corner))
    }
}

private struct OvioElevated: ViewModifier {
    let elevation: OvioElevation
    var corner: CGFloat = 16

    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: corner)
                    .fill(OvioSurfacePaint.well)
                    .shadow(
                        color: elevation == .primary ? OvioColors.warmGold.opacity(0.35) : .clear,
                        radius: elevation == .primary ? 18 : 0
                    )
            }
            .overlay {
                RoundedRectangle(cornerRadius: corner)
                    .strokeBorder(
                        OvioSurfacePaint.rim(elevation),
                        lineWidth: elevation == .quiet ? 0.5 : 1
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: corner))
    }
}

private struct OvioPrimaryAction: ViewModifier {
    var corner: CGFloat = 16
    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: corner)
                    .fill(OvioColors.accent.opacity(0.16))
            }
            .overlay {
                RoundedRectangle(cornerRadius: corner)
                    .strokeBorder(OvioColors.accent.opacity(0.45), lineWidth: 0.5)
            }
            .clipShape(RoundedRectangle(cornerRadius: corner))
    }
}

extension View {
    func ovioSurface(corner: CGFloat = 16, fill: Double = 0.06, stroke: Double = 0.08) -> some View {
        modifier(OvioSurface(corner: corner, fill: fill, stroke: stroke))
    }

    func ovioElevated(_ elevation: OvioElevation, corner: CGFloat = 16) -> some View {
        modifier(OvioElevated(elevation: elevation, corner: corner))
    }

    func ovioPrimaryAction(corner: CGFloat = 16) -> some View {
        modifier(OvioPrimaryAction(corner: corner))
    }
}
