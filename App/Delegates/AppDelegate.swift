import BridgeComponents
import HotwireNative
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        Hotwire.registerBridgeComponents(Bridgework.coreComponents)

        // Show each web page in our WebViewController, which adds a Cancel button to modal screens.
        Hotwire.config.defaultViewController = { url in WebViewController(url: url) }

        // The back button shows just a chevron, not the previous page's title.
        Hotwire.config.backButtonDisplayMode = .minimal

        // Log what Hotwire is doing to Xcode's console while developing.
        #if DEBUG
            Hotwire.config.debugLoggingEnabled = true
        #endif

        return true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
