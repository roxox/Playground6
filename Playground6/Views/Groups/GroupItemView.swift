//
//  GroupItemView.swift
//  Playground6
//
//  Created by Sebastian Fox on 01.01.21.
//

import SwiftUI

struct GroupItemView: View {
    let itemWidth: CGFloat = (deviceWidth-30)/2
    let itemHeight: CGFloat = (deviceWidth-30)/2*1.35
    
    // constants
    let numberOfGroups = 4
    
    // For testing
    var groupUsers: [AppUser] {
        [
            appUserData[0],
            appUserData[1],
            appUserData[2],
            appUserData[5],
            appUserData[3]
        ]
    }
    
    // current page of user chunks
    @State var currentPage = 0
    
    // grid layout
    var fixedLayout: [GridItem] {
        [
            .init(.fixed((deviceWidth-30)/2)),
            .init(.fixed((deviceWidth-30)/2))
        ]
    }
    
    var body: some View {
        LazyVStack() {
            Text("Gruppen")
            TabView(selection: $currentPage){
                ForEach(appUserData, id: \.self) { user in
                    LazyVGrid(columns: fixedLayout) {
                        ForEach(appUserData, id: \.self) { user in
                            user.image
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                                .frame(width: itemWidth, height: itemHeight)
                                .cornerRadius(15)
                                
                                .overlay(
                                    UserOverlay(user: user)
                                )
                        }
                        
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct GroupItemView_Previews: PreviewProvider {
    static var previews: some View {
        GroupItemView()
    }
}
