import SwiftUI

/// iOS equivalent of MainActivity.kt + OvioTheme.kt.
@main
struct OvioLiteApp: App {
    var body: some Scene {
        WindowGroup {
            OvioAppView()
                .preferredColorScheme(.dark)
        }
    }
}
