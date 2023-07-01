//
//  HomeChefApp.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 27/11/1444 AH.
//

import SwiftUI
import FirebaseCore
import Firebase


@main
struct HomeChefApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
           Onboarding()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
