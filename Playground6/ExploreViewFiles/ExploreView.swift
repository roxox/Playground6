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

struct ExploreView: View {
    @EnvironmentObject var menuControl: MenuControl
    @State var showingDetail = false
    @State var groups = appGroupData
    @State var users = appUserData
    @State var design = Design.tile4
    @State var viewIndex = ViewIndex.groups
    @State var lastViewIndex = ViewIndex.groups
    
    private let items: [String] = ["Gruppen", "Personen"]
    //    private let items: [String] = ["Gruppen", "Personen"]
    @Binding var createNewGroup: Bool
    
    @State var currentPage = 0
    @State var index = 0
    
    //    func createPageView() -> View {
    //        let pageView =
    //            PageView([
    //                ViewSelectionView(viewIndex: .groups,
    //                                  groups: $groups,
    //                                  design: $design,
    //                                  users: $users,
    //                                  createNewGroup: $createNewGroup
    //                ),
    //                ViewSelectionView(viewIndex: .persons,
    //                                  groups: $groups,
    //                                  design: $design,
    //                                  users: $users,
    //                                  createNewGroup: $createNewGroup
    //                ),
    //                ViewSelectionView(viewIndex: .search,
    //                                  groups: $groups,
    //                                  design: $design,
    //                                  users: $users,
    //                                  createNewGroup: $createNewGroup
    //                )
    //            ])
    //
    //        return pageView
    //    }
    
    func toggleCreateNewGroup() {
        if createNewGroup {
            self.deactivateCreateNewGroup()
        } else {
            self.activateCreateNewGroup()
        }
    }
    
    func activateCreateNewGroup() {
        createNewGroup = true
        lastViewIndex = viewIndex
        viewIndex = .persons
    }
    
    func deactivateCreateNewGroup() {
        createNewGroup = false
        viewIndex = lastViewIndex
    }
    
    var body: some View {
        ZStack() {
            VStack(alignment: .center) {
                                    if !createNewGroup {
                                        ZStack() {
                
                                            HStack() {
                                                Spacer()
                                                SegmentedPicker(items: items, selection: $index)
                                                Spacer()
                                            }
                                            .padding(.horizontal, 80)
                                        }
                                        .padding(.bottom, 5)
                                    }
                
                
                ////
                TabView(selection: $index) {
                    UsersView(users: $users, createNewGroup: $createNewGroup)
                        .tag(0)
                    UsersView3(users: $users, createNewGroup: $createNewGroup)
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                //                                    ViewSelectionView(viewIndex: .groups2,
                //                                                      groups: $groups,
                //                                                      design: $design,
                //                                                      users: $users,
                //                                                      createNewGroup: $createNewGroup
                //                                    )
                //
                //                                    ViewSelectionView(viewIndex: .persons,
                //                                                      groups: $groups,
                //                                                      design: $design,
                //                                                      users: $users,
                //                                                      createNewGroup: $createNewGroup
                //                                    )
                
                //                    PageView([
                //                        ViewSelectionView(viewIndex: .groups2,
                //                                          groups: $groups,
                //                                          design: $design,
                //                                          users: $users,
                //                                          createNewGroup: $createNewGroup
                //                        ),
                //                        ViewSelectionView(viewIndex: .persons,
                //                                          groups: $groups,
                //                                          design: $design,
                //                                          users: $users,
                //                                          createNewGroup: $createNewGroup
                //                        )
                //                    ], currentPage: $currentPage)
                Spacer()
            }
            VStack() {
                Spacer()
                HStack() {
                    Spacer()
                    
                    NavigationLink(destination: UsersList(users: $users, createNewGroup: $createNewGroup)) {
                        Circle()
                            .fill(Color .black)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: createNewGroup ? "xmark" : "square.and.pencil")
                                    .font(.systemBold(size: 22))
                                    .imageScale(.medium)
                                    .foregroundColor(Color .white)
                                    .frame(width: 24, height: 24)
                                    .offset(y: -2)
                                
                            )
                            .shadow(radius: 2, y: 1)
                            .padding(.trailing, 16)
                            .padding(.vertical, 16)
                            .padding(.trailing, 10)
                    }
                }
                Rectangle().fill(Color.clear).frame(height: 50)
            }
            .offset(y: viewIndex == .search ? 150 : createNewGroup ? 20 : -40)
        }
        .edgesIgnoringSafeArea(.bottom)
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

enum Design: Int {
    case list = 0
    case tile = 1
    case tile4 = 2
}

enum ViewIndex: Int {
    case groups = 1
    case persons = 2
    case search = 3
    case persons2 = 4
    case groups2 = 5
}
