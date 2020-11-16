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
    @Binding var createNewGroup: Bool
    
    @State var currentPage = 0
    
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
                
                if design != .tile4 {
                    ZStack() {
                        
                        HStack() {
                            
                        }
                        
                        // Searchbutton
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color ("bright_gray"))
                            .frame(height: 40)
                            .overlay(
                                HStack() {
                                    Image(systemName: "magnifyingglass")
                                        //                            .font(.system(size: 18, weight: .medium))
                                        .font(.systemSemibold(size: 20))
                                        .foregroundColor(Color ("gray"))
                                    
                                    Text("Suche")
                                        .font(.system(size: 18))
                                        //                            .fontWeight(.medium)
                                        .foregroundColor(Color ("gray"))
                                    Spacer()
                                }
                                .padding(.leading, 15)
                                .offset(y: 1)
                            )
                            .padding(.top, 3)
                            .padding(.bottom, 3)
                            .padding(.horizontal, 16)
                        
                        
                        
                        HStack() {
                            
                            Spacer()
                            
                            Button(action: {
                                self.menuControl.showSearchMenu.toggle()
                            }) {
                                Image(systemName: "slider.horizontal.3")
                                    .font(.systemBold(size: 22))
                                    .imageScale(.medium)
                                    //                            .foregroundColor(.black)
                                    .foregroundColor(Color ("almost_black"))
                                    //                            .foregroundColor(.gray)
                                    .frame(width: 24, height: 24)
                            }.sheet(isPresented: $showingDetail) {
                                NewGroupView(showingDetail: self.$showingDetail,
                                             groups: $groups)
                            }
                            .padding(.trailing, 3)
                            
                            Button(action: {
                                self.showingDetail.toggle()
                            }) {
                                //                            Image(systemName: "square.and.pencil")
                                Image(systemName: "magnifyingglass")
                                    //                            .font(.system(size: 22, weight: .bold))
                                    .font(.systemBold(size: 22))
                                    .imageScale(.medium)
                                    //                            .foregroundColor(.black)
                                    //                            .foregroundColor(Color .gray)
                                    .foregroundColor(Color ("almost_black"))
                                    //                            .foregroundColor(.gray)
                                    .frame(width: 24, height: 24)
                            }.sheet(isPresented: $showingDetail) {
                                NewGroupView(showingDetail: self.$showingDetail,
                                             groups: self.$groups)
                            }
                            .padding(.leading, 3)
                            .offset(y: -1)
                        }
                        .padding(.horizontal, 16)
                        .padding(.horizontal, 12)
                        
                    }
                } else {
                    if !createNewGroup {
                    ZStack() {
                        HStack() {
                            
                            if viewIndex == ViewIndex.persons || viewIndex == ViewIndex.search {
                                HStack() {
                                    Text("Gruppen")
                                        .font(.systemSemibold(size: 17))
                                        .foregroundColor(.clear)
                                }
                                .padding(5)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color .clear)
                                .cornerRadius(23)
                                //                            .offset(x: 8)
                            }
                            //
                            if viewIndex == ViewIndex.search {
                                HStack() {
                                    Text("Personen")
                                        .font(.systemSemibold(size: 17))
                                        .foregroundColor(.clear)
                                }
                                .padding(5)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color .clear)
                                .cornerRadius(23)
                                .offset(x: 0)
                            }
                            
                            HStack() {
                                Text(viewIndex == .persons ? "Personen" : viewIndex == .groups ? "Gruppen" : "Suche")
                                    .font(.systemSemibold(size: 17))
                                    .foregroundColor(.clear)
                            }
                            .padding(5)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 8)
                            .background(Color .black)
                            //                            .background(viewIndex == ViewIndex.groups ? Color .black : Color .white)
                            .cornerRadius(23)
                            .padding(0)
                            .offset(x: viewIndex == .persons ? -4 : viewIndex == .groups ? 8 : -12)
                            
                            if viewIndex == ViewIndex.groups {
                                HStack() {
                                    Text("Personen")
                                        .font(.systemSemibold(size: 17))
                                        .foregroundColor(.clear)
                                }
                                .padding(5)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color .clear)
                                .cornerRadius(23)
                                .offset(x: 0)
                            }
                            //
                            if viewIndex == ViewIndex.groups || viewIndex == ViewIndex.persons {
                                HStack() {
                                    Text("Suche")
                                        .font(.systemSemibold(size: 17))
                                        .foregroundColor(.clear)
                                }
                                .padding(5)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color .clear)
                                .cornerRadius(23)
                            }
                        }
                        
                        HStack() {
                            Button(action: {
                                withAnimation(.linear(duration: 0.2)) {
//                                    self.viewIndex = ViewIndex.groups
                                    self.currentPage = 0
                                }
                            }) {
                                HStack() {
                                    Text("Gruppen")
                                        .font(.systemSemibold(size: 17))
                                        .foregroundColor(viewIndex == ViewIndex.groups ? .white : .black)
                                }
                                .padding(5)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .cornerRadius(23)
                                .offset(x: 12)
                            }
                            
                            Button(action: {
                                withAnimation(.linear(duration: 0.2)) {
//                                    self.viewIndex = ViewIndex.persons
                                    self.currentPage = 1
                                }
                            }) {
                                HStack() {
                                    Text("Personen")
                                        .font(.systemSemibold(size: 17))
                                        .foregroundColor(viewIndex == ViewIndex.persons ? .white : .black)
                                }
                                .padding(5)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .cornerRadius(23)
                                .padding(0)
                            }
                            
                            
                            Button(action: {
                                withAnimation(.linear(duration: 0.2)) {
//                                    self.viewIndex = ViewIndex.search
                                    self.currentPage = 2
                                }
                            }) {
                                HStack() {
                                    Text("Suchen")
                                        .font(.systemSemibold(size: 17))
                                        .foregroundColor(viewIndex == ViewIndex.search ? .white : .black)
                                }
                                .padding(5)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .cornerRadius(23)
                                .offset(x: -12)
                            }
                        }
                    }
                    .padding(.bottom, 5)
                    }
                }
                if design == .tile4 {
                    PageView([
                        ViewSelectionView(viewIndex: .groups,
                                          groups: $groups,
                                          design: $design,
                                          users: $users,
                                          createNewGroup: $createNewGroup
                        ),
                        ViewSelectionView(viewIndex: .persons,
                                          groups: $groups,
                                          design: $design,
                                          users: $users,
                                          createNewGroup: $createNewGroup
                        ),
                        ViewSelectionView(viewIndex: .search,
                                          groups: $groups,
                                          design: $design,
                                          users: $users,
                                          createNewGroup: $createNewGroup
                        )
                    ], currentPage: $currentPage)
                }
                
                //            }
                Spacer()
            }
            //            if viewIndex != .search {
            VStack() {
                Spacer()
                HStack() {
                    Spacer()
                    Button(action: {
                        withAnimation(.linear(duration: 0.2)) {
                            self.toggleCreateNewGroup()
                            
                        }
                    }) {
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
//                    }
                }
                Rectangle().fill(Color.clear).frame(height: 50)
                //            }
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
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}


enum Design: Int {
    case list = 0
    case tile = 1
    case tile4 = 2
}

enum ViewIndex: Int {
    case groups = 1
    case persons = 2
    case search = 3
}
