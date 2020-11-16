//
//  Playground6App.swift
//  Playground6
//
//  Created by Sebastian Fox on 21.10.20.
//

import SwiftUI

@main
struct Playground6App: App {
    
    let menuControl = MenuControl()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(menuControl)
        }
    }
}
