//
//  FirstView.swift
//  Playground6
//
//  Created by Sebastian Fox on 25.10.20.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject var menuControl: MenuControl
    @State var showCategoryMenu = false
    @State var showSearchMenu = false
    @State var showOpacityLayer = false
    var body: some View {
        ZStack() {
            ExploreView()
                .padding(.top, 4)
            
            // Menus
                ZStack() {
                    if self.showOpacityLayer {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    }
                    SearchMenu()
                        .offset(y: self.showSearchMenu ? 0 : 800)
                        .padding(.horizontal, 8)
                        .padding(.bottom, 8)
                }
        }
        .onReceive(self.menuControl.showSearchMenuWillChange) { newValue in
            withAnimation(.linear(duration: 0.3)) {
                self.showSearchMenu = newValue
                self.showOpacityLayer = newValue
            }
        }
    }
}
