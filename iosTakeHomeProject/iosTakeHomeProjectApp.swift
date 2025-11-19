//
//  iosTakeHomeProjectApp.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 26/09/2025.
//

import SwiftUI

@main
struct iosTakeHomeProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            TabView {
                PeopleView()
                    .tabItem {
                        Symbols.person
                        Text("Home")
                        
                    }
                SettingsView()
                    .tabItem {
                        Symbols.gear
                        Text("Settings")
                    }
            }
        }
    }
}


class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        #if DEBUG
        
        print("👷🏼 Is UI Test running \(UITestingHelper.isUITesting)")
        #endif
        return true
    }
}
