//
//  Playground6App.swift
//  Playground6
//
//  Created by Sebastian Fox on 21.10.20.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("Colors application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
    return true
  }
}

@main
struct Playground6App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
      FirebaseApp.configure()
        
        // read current user
        let user = Auth.auth().currentUser
        let xxx = user?.email
        if xxx == nil {
            Auth.auth().signIn(withEmail: "sebastian.fox@me.com", password: "audiR8GTx.3") { (result, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                } else {
                    print("login ok")
//                    self.currentUser = Auth.auth().currentUser
//                    self.isLogged = true
//                    self.getPublicUserDataByUID(self.currentUser!.uid) { publicUserData in
//                        self.publicUserData = publicUserData
//                    }
                }
                
            }
        }
    }
    
    let menuControl = MenuControl()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(menuControl)
        }
    }
}
