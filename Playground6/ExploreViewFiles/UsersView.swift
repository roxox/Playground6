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
    
    var body: some View {
        UsersList(users: $users, createNewGroup: $createNewGroup)
    }
}

//struct UsersView_Previews: PreviewProvider {
//    static var previews: some View {
//        UsersView()
//    }
//}
