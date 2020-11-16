//
//  NewGroupView.swift
//  Playground6
//
//  Created by Sebastian Fox on 23.10.20.
//

import SwiftUI

struct NewGroupView: View {
    
    @EnvironmentObject var menuControl: MenuControl
    @State var selectedUsers: [AppUser] = []
    @State var pageIndex: UserComponentPageIndex = UserComponentPageIndex.listView
    @Binding var showingDetail: Bool
    @Binding var groups: [AppUserGroup]
    
    var body: some View {
        
        
//        if pageIndex == .listView {
//            UserComponent(
//                pageIndex: self.$pageIndex,
//                selectedUsers: self.$selectedUsers,
//                showingDetail: self.$showingDetail,
//                groups: self.$groups
//            )
//                .padding(.top, 4)
//        } else if pageIndex == .detailsView {
            GroupDetails(
                pageIndex: self.$pageIndex,
                selectedUsers: self.$selectedUsers,
                showingDetail: self.$showingDetail,
                groups: $groups
            )
//            .padding(.top, 4)
//        }
    }
}

//struct NewGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewGroupView()
//    }
//}
