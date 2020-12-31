//
//  ViewSelectionView.swift
//  Playground6
//
//  Created by Sebastian Fox on 13.11.20.
//

import SwiftUI

struct ViewSelectionView: View {
    let viewIndex: ViewIndex!
    @Binding var groups: [AppUserGroup]
    @Binding var design: Design
    @Binding var users: [AppUser]
    @Binding var createNewGroup: Bool
    
    var body: some View {
        VStack() {
        if viewIndex == .groups {
            GroupsView(groups: $groups, design: $design)
        } else  if viewIndex == .groups2 {
            UsersView(users: $users, createNewGroup: $createNewGroup)
        } else  if viewIndex == .persons {
            UsersView3(users: $users, createNewGroup: $createNewGroup)
        } else  if viewIndex == .persons2 {
            UsersView2(users: $users, createNewGroup: $createNewGroup)
        } else  if viewIndex == .search {
            SearchView()
        } else {
            Text("Illegal State")
        }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}

//struct ViewSelectionView_Previews: PreviewProvider {
//    let viewIndex = ViewIndex.groups
//    static var previews: some View {
//        ViewSelectionView(viewIndex: viewIndex)
//    }
//}
