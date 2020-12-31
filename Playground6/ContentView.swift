//
//  ContentView.swift
//  Playground6
//
//  Created by Sebastian Fox on 21.10.20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var menuControl: MenuControl
    @State var showSelectedUserMenu = false
    @State var showSearchMenu = false
    @State var showOpacityLayer = false
    @State var pageIndex = 0
    @State var isSearchActive = true
    @State var selectedUser: AppUser?
    @State var createNewGroup: Bool = false
    
    func isMenuActive() -> Bool {
        if menuControl.showSearchMenu == true {
            return true
        }
        return false
    }
    
    var body: some View {
        NavigationView() {
        ZStack() {
            
//            switch pageIndex {
//            case 0:
//                if isSearchActive {
//                ExploreView()
//                } else {
//                    SearchDeactivatedView(isSearchActive: $isSearchActive)
//                        .padding(.top, 4)
//                }
//            case 1:
//                if isSearchActive {
//                ExploreView()
////                    .padding(.top, 4)
//                } else {
//                    SearchDeactivatedView(isSearchActive: $isSearchActive)
//                        .padding(.top, 4)
//                }
////            case 2:
////                self = .member
////            case 3:
////                self = .banned
//            default:
//                print("default")
////                throw CodingError.unknownValue
//            }
            
            if pageIndex == 0 {
                if isSearchActive {
                    ExploreView(createNewGroup: $createNewGroup)
                } else {
                    SearchDeactivatedView(isSearchActive: $isSearchActive)
                        .padding(.top, 4)
                }
            } else if pageIndex == 1 {
                MyGroupsView()
            } else if pageIndex == 2 {
                TestView2()
            }
            
                VStack{
                    Spacer()
                    ButtonBarView(viewIndex: $pageIndex)
                        .edgesIgnoringSafeArea(.all)
                        .offset(y: createNewGroup ? 100 : 0)
                }
            
            
            // Menus
            ZStack() {
                if self.showOpacityLayer {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            menuControl.showSearchMenu = false
                            menuControl.showUserSelectedMenu = false
                        }
                }
                MenuSearch(isSearchActive: $isSearchActive)
                    .offset(y: self.showSearchMenu ? 0 : 500)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
                MenuUserSelection(isSearchActive: $isSearchActive, selectedUser: $selectedUser)
                    .offset(y: self.showSelectedUserMenu ? 0 : 300)
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
        .onReceive(self.menuControl.selectedUserWillChange) { newValue in
            withAnimation(.linear(duration: 0.3)) {
                selectedUser = newValue
                print(selectedUser?.username)
            }
        }
        .onReceive(self.menuControl.showUserSelectedMenuWillChange) { newValue in
            withAnimation(.linear(duration: 0.3)) {
                self.showSelectedUserMenu = newValue
                self.showOpacityLayer = newValue
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
