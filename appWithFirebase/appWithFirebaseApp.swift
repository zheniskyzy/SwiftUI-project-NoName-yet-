//
//  appWithFirebaseApp.swift
//  appWithFirebase
//
//  Created by Madina Olzhabek on 18.12.2024.
//

import SwiftUI
import FirebaseCore

@main
struct appWithFirebaseApp: App {
    
//    init () {
//        FirebaseApp.configure()
//        print("Firebase is Configured")
//    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
     
        return true
    }
}

