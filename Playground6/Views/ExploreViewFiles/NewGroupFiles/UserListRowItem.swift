//
//  UserListRow.swift
//  twentyfour
//
//  Created by Sebastian Fox on 21.10.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct UserListRowItem: View {
    var appUser: AppUser
    //    @State var isUserSelected = false
    @State private var showUserProfile = false
    @Binding var selectedUsers: [AppUser]
    
    func addUserToSelectedUsers(_ user: AppUser) {
        if !selectedUsers.contains(user) {
            selectedUsers.append(user)
        }
    }
    
    func removeUserFromSelectedUsers(_ user: AppUser) {
        if selectedUsers.contains(user) {
            selectedUsers.remove(at: selectedUsers.firstIndex(of: user)!)
        }
    }
    
    func isUserSelectedAction(_ user: AppUser) {
        if !selectedUsers.contains(user) {
            addUserToSelectedUsers(user)
        } else {
            removeUserFromSelectedUsers(user)
        }
    }
    
    var body: some View {
        HStack {
            self.appUser.image
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            ZStack(){
                HStack() {
                    Button(action: {
                        withAnimation(.linear(duration: 0.2)) {
                            self.showUserProfile.toggle()
                        }
                    }) {
                        Text(appUser.username)
                            .font(appUser.username == "Sebastian" ? .systemSemibold(size: 18) : .systemSemibold(size: 18))
                            .foregroundColor(.black)
                            //                        .fontWeight(.medium)
                            .padding(.horizontal, 5)
                    }.sheet(isPresented: $showUserProfile) {
                        UserProfileView(showUserProfile: $showUserProfile, user: appUser)
                    }
//                    .padding(.horizontal, 16)
//                    .padding(.vertical, 4)
//                    .padding(.bottom, 4)
//                    .padding(.top, 10)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.linear(duration: 0.2)) {
                            self.isUserSelectedAction(appUser)
                        }
                    }) {
                        if selectedUsers.contains(appUser) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 24))
                                .imageScale(.medium)
                                .foregroundColor(.black)
                                .frame(width: 24, height: 24)
                        } else {
                            Image(systemName: "circle")
                                .font(.system(size: 24))
                                .imageScale(.medium)
                                .foregroundColor(Color ("mid_gray"))
                                .frame(width: 24, height: 24)
                        }
                    }
                }
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(Color ("bright_gray"))
                    .padding(.leading, 5)
                    .offset(y: 30)
            }
            //            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 7)
    }
}

//struct UserListRow_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        UserListRow(appUser: appUserData[0])
//    }
//}
