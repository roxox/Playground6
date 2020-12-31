//
//  MyGroupsView.swift
//  Playground6
//
//  Created by Sebastian Fox on 06.11.20.
//

import SwiftUI

struct MyGroupsView: View {
    @EnvironmentObject var menuControl: MenuControl
    @State var showingDetail = false
    @State var groups = appGroupData
    @State var design = Design.list
    @State var currentPage = 0
    
    var body: some View {
        VStack(alignment: .center) {
            
            ZStack() {
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
                            .font(.systemBold(size: 20))
//                            .imageScale(.medium)
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
                        Image(systemName: "square.and.pencil")
                            .font(.systemBold(size: 20))
                            .imageScale(.medium)
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
            ScrollView() {
//                if design == .list {
//                UserShowroom()
//                } else {
//                    UserShowroom_2()
//                }
                GroupList(groups: $groups, design: $design)
                
                PageView([
                    Text("Hallo"),
                    Text("Hallo")
                ], currentPage: $currentPage)
            }
            Spacer()
        }
        
    }
}
