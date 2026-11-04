# xcode-template

A minimal [Hotwire Native](https://native.hotwired.dev) iOS app: a native shell that shows your
Rails app's pages, with [Joe Masilotti's Bridge Components](https://github.com/joemasilotti/bridge-components)
already installed. It's the starting point for First Draft's Hotwire Native lessons, and for your
own apps.

## Use it

1. Click **Use this template → Create a new repository**. If you already made one from this
   template, give the new one a different name (e.g. `xcode-bridge-components-sandbox`).
2. Clone your new repository to your Mac, e.g. `gh repo clone <your-username>/<your-repo>`.
3. Open `XcodeTemplate.xcodeproj` in Xcode, choose an iPhone simulator at the top of the window,
   and click Run (▶).

The app loads `http://localhost:3000`, so start your Rails app first. In a Codespace, forward the
port to your Mac with `gh codespace ports forward 3000:3000`. The simulator shares your Mac's
network, so `localhost` is your Mac.

## What's inside

- `App/Delegates/SceneDelegate.swift`: the `baseURL` and the `Navigator` that loads it.
- `App/Delegates/AppDelegate.swift`: registers the Bridge Components and a few Hotwire settings
  (our `WebViewController`, a minimal back button, debug logging).
- `App/Controllers/WebViewController.swift`: the screen that shows each web page. It adds a Cancel
  button to screens that open as modals.
- `App/Resources/Info.plist`: allows plain `http` to `localhost` (`NSAllowsLocalNetworking`), and
  the camera, microphone and photo library usage descriptions that iOS requires before a page's
  file input can offer the camera (without them, the app is terminated).
- Swift packages: `hotwire-native-ios` and `bridge-components`, each set to "Up to Next Minor
  Version", because minor releases can include breaking changes.

## Before you ship

Rename the app and give it your own bundle identifier: in Xcode, select the project, then the
`XcodeTemplate` target, and in the General tab change Display Name and Bundle Identifier (e.g.
`com.yourname.yourapp`). Then point `baseURL` at your production URL.

## Troubleshooting

- **"Error loading page: Could not connect to the server"**: the Rails app isn't reachable at
  `http://localhost:3000` on your Mac. Check `bin/dev` is running and, for a Codespace, that the
  `gh codespace ports forward` command is still running.
- **Moved `Info.plist`?** Update Build Settings → "Info.plist File", or the build fails.

All files are covered by the MIT license, see [LICENSE.txt](LICENSE.txt).
