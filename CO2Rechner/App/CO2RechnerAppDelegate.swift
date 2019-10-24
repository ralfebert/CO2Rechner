// © 2019 Ralf Ebert — iOS Example Project: CO2Rechner
// License: https://opensource.org/licenses/MIT

import SwiftUI
import UIKit

@UIApplicationMain
class CO2RechnerAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow()
        window.rootViewController = UIHostingController(rootView: CO2RechnerView())
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}
