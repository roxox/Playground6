//
//  MainView.swift
//  Playground6
//
//  Created by Sebastian Fox on 23.10.20.
//

import SwiftUI

let sizeHeadline = 20
let sizeText = 14
let sizeCircleExploreView: CGFloat = 78
let sizeRoundedRectangelExploreView: CGFloat = 68

struct ExploreView_old: View {
    @EnvironmentObject var menuControl: MenuControl
    @State var groups = appGroupData
    @State var users = appUserData
    @State var viewIndex = ViewIndex.groups
    @State var lastViewIndex = ViewIndex.groups
    
    private let items: [String] = ["Gruppen", "Personen"]
    
    @Binding var createNewGroup: Bool
    
    @State var currentPage = 0
    
    var body: some View {
        ZStack() {
            VStack(alignment: .center) {
                
                PageView([
                    ViewSelectionView(viewIndex: .groups,
                                      groups: $groups,
                                      users: $users
                    ),
                    ViewSelectionView(viewIndex: .users,
                                      groups: $groups,
                                      users: $users
                    )
                ], currentPage: $currentPage)
                Spacer()
            }
            VStack() {
                Spacer()
                HStack() {
                    Spacer()
                    
                    NavigationLink(destination: NewGroupUserSelectionView(users: $users, createNewGroup: $createNewGroup)) {
                        Circle()
                            .fill(Color .black)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: createNewGroup ? "xmark" : "plus")
                                    .font(.system(size: 30))
                                    .imageScale(.medium)
                                    .foregroundColor(Color .white)
                                    .frame(width: 24, height: 24)
                                    .offset(y: -2)
                                
                            )
                            .shadow(radius: 2, y: 1)
                            .padding(.trailing, 25)
                            .padding(.vertical, 16)
                    }
                }
                Rectangle().fill(Color.clear).frame(height: 30)
            }
        }
        .background(Color .black)
        .edgesIgnoringSafeArea(.all)
    }
}


var gradientSuperBrightGrayWhite: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
                    .white,
                    Color ("super_bright_gray"),
                    .white,
                ]),
        startPoint: .top,
        endPoint: .bottom)
}

var gradientPinkOrange: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
                    
                    Color("peach"),
//                    .purple,
                    .pink,
//                    Color("peach"),
//                    .orange
                ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

enum Design: Int {
    case list = 0
    case tile = 1
    case tile4 = 2
}

enum ViewIndex: Int {
    case groups = 1
    case users = 2
}

struct ViewSelectionView: View {
    let viewIndex: ViewIndex!
    @Binding var groups: [AppUserGroup]
    @Binding var users: [AppUser]
    
    // FOR TESTING
    @State var entertain: Bool = false
    @State var food: Bool = false
    @State var sport: Bool = false
    @State var search: Bool = false
    @State var isCircle: Bool = false
    
    var body: some View {
        VStack() {
            if viewIndex == .groups {
                GroupsMainView(
                    users: $users,
                    entertain: $entertain,
                    food: $food,
                    sport: $sport,
                    search: $search,
                    isCircle: $isCircle
                ).background(Color.black)
            } else  if viewIndex == .users {
                UsersMainView(
                    users: $users,
                    entertain: $entertain,
                    food: $food,
                    sport: $sport,
                    search: $search,
                    isCircle: $isCircle
                )
            } else {
                Text("Illegal State")
            }
        }
//        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}
