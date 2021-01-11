//
//  UsersView.swift
//  Playground6
//
//  Created by Sebastian Fox on 13.11.20.
//

import SwiftUI

struct UsersView: View {
    
    @Binding var users: [AppUser]
    @Binding var createNewGroup: Bool
    @State var toggleOn: Bool = false
    
    var body: some View {
        
//        ZStack() {
//            Image("water_1")
//                .renderingMode(.original)
//                .resizable()
//                .scaledToFit()
//                .frame(width: deviceWidth, height: deviceHeight)
//                .edgesIgnoringSafeArea(.all)
            
        ScrollView {
            LazyVStack {
            Rectangle()
                .fill(Color .white)
                .frame(height: 20)
                
//                GroupItemView()
//                GroupItemView()
//                GroupItemView()
//                GroupItemView()
//                GroupItemView()
//                GroupItemView()
//                GroupItemView()
//                GroupItemView()
            
            UsersList4(users: $users, createNewGroup: $createNewGroup, appGroup: appGroupData[4], hardUsers: [appUserData[0],appUserData[1],appUserData[2],appUserData[5],appUserData[3]])
            UsersList4(users: $users, createNewGroup: $createNewGroup, appGroup: appGroupData[3], hardUsers: [appUserData[3],appUserData[4],appUserData[5]])
            UsersList4(users: $users, createNewGroup: $createNewGroup, appGroup: appGroupData[4], hardUsers: [appUserData[0],appUserData[1],appUserData[2]])
            UsersList4(users: $users, createNewGroup: $createNewGroup, appGroup: appGroupData[3], hardUsers: [appUserData[3],appUserData[4],appUserData[5]])
            UsersList4(users: $users, createNewGroup: $createNewGroup, appGroup: appGroupData[4], hardUsers: [appUserData[2]])
            UsersList4(users: $users, createNewGroup: $createNewGroup, appGroup: appGroupData[3], hardUsers: [appUserData[3],appUserData[4],appUserData[5]])
            Rectangle()
                .fill(Color .white)
                .frame(height: 60)
            }
//        }
        }
    }
}
