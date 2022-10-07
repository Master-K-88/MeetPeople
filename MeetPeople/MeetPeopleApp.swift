//
//  MeetPeopleApp.swift
//  MeetPeople
//
//  Created by Prof K on 10/3/22.
//

import SwiftUI
import IQKeyboardManagerSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        IQKeyboardManager.shared.enable = true
        
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
        
        return true
    }
}

@main
struct MeetPeopleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
