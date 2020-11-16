//
//  UserProfileView.swift
//  Playground6
//
//  Created by Sebastian Fox on 26.10.20.
//

import SwiftUI
import MapKit

struct UserProfileView: View {
    @Binding var showUserProfile: Bool
    var user: AppUser!
    
    var body: some View {
        if user != nil {
            Text(user.username)
        }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
