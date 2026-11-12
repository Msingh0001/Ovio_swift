import SwiftUI

/// Kotlin: OvioColors.kt. Hex values match the Android version exactly.
enum OvioColors {
    static let background = Color(hex: 0x14100A)
    static let ground = Color(hex: 0x090806)
    static let tabBar = Color(hex: 0x0E0C0A)

    static let textPrimary = Color(hex: 0xF5E8D0)
    static let textBody = Color(hex: 0xE4D6BE)
    static let textSecondary = Color(hex: 0xBCAA8E)
    static let textMuted = Color(hex: 0xB3A087)
    static let textFaint = Color(hex: 0x93836B)

    static let highlight = Color(hex: 0xFACC8C)
    static let champagne = Color(hex: 0xCCB38F)
    static let warmGold = Color(hex: 0xD1944D)
    static let bronze = Color(hex: 0x917A5C)
    static let bronzeDeep = Color(hex: 0x704521)
    static let warmIvory = Color(hex: 0xE8E0D1)
    static let accent = Color(hex: 0xD1A24A)

    static let wordmark = LinearGradient(
        stops: [
            .init(color: warmIvory.opacity(0.96), location: 0),
            .init(color: champagne.opacity(0.90), location: 0.5),
            .init(color: bronzeDeep.opacity(0.80), location: 1)
        ], startPoint: .top, endPoint: .bottom
    )

    static func scoreColor(_ score: Int) -> Color {
        switch min(max(score, 0), 100) {
        case 90...100: return Color(hex: 0xE9D9AE)
        case 80...89: return Color(hex: 0xDFC894)
        case 70...79: return Color(hex: 0xD5B778)
        case 60...69: return Color(hex: 0xCBA65F)
        case 50...59: return Color(hex: 0xC59450)
        case 40...49: return Color(hex: 0xC08245)
        case 30...39: return Color(hex: 0xBC6F3D)
        case 20...29: return Color(hex: 0xB85C36)
        default: return Color(hex: 0xB44A30)
        }
    }
}

extension Color {
    init(hex: UInt32) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: 1
        )
    }
}

/// Kotlin: OvioTheme.kt. Serif sizing matches its Material typography tokens.
enum OvioFont {
    static let wordmark = Font.system(size: 44, weight: .regular, design: .serif)
    static let headline = Font.system(size: 26, weight: .regular, design: .serif)
    static let titleLarge = Font.system(size: 22, weight: .regular, design: .serif)
    static let titleMedium = Font.system(size: 17, weight: .semibold, design: .serif)
    static let bodyLarge = Font.system(size: 15, weight: .regular, design: .serif)
    static let bodyMedium = Font.system(size: 13, weight: .regular, design: .serif)
    static let labelLarge = Font.system(size: 13, weight: .medium, design: .serif)
    static let labelSmall = Font.system(size: 10, weight: .bold, design: .serif)
}
