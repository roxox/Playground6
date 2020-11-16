//
//  UserList.swift
//  twentyfour
//
//  Created by Sebastian Fox on 21.10.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct UserList: View {
    @Binding var selectedUsers: [AppUser]
    
//    init() {
//        if #available(iOS 14.0, *) {
//            // iOS 14 doesn't have extra separators below the list by default.
//        } else {
//            // To remove only extra separators below the list:
//            UITableView.appearance().tableFooterView = UIView()
//        }
//
//        // To remove all separators including the actual ones:
//        UITableView.appearance().separatorStyle = .none
//    }
    
    var body: some View {
        ScrollView() {
            LazyVStack() {
                HStack(){
                    Text("VORSCHLÄGE")
                        .font(.systemSemibold(size: 13))
//                        .fontWeight(.medium)
                        .foregroundColor(Color ("gray"))
                    Spacer()
                }.padding(.horizontal, 16)
                                                                             
                // Liste
                ForEach(appUserData, id: \.id) { user in
                    UserListRowItem(appUser: user,
                                selectedUsers: $selectedUsers
                                )
                }
            }
            .padding(.top, 4)
        }
    }
    
//    struct UserList_Previews: PreviewProvider {
//        static var previews: some View {
//            UserList()
//        }
//    }
}
