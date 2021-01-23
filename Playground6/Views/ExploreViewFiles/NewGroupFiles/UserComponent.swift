//
//  UserComponent.swift
//  twentyfour
//
//  Created by Sebastian Fox on 21.10.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct UserComponent: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var pageIndex: UserComponentPageIndex
    @Binding var selectedUsers: [AppUser]
    @Binding var showingDetail: Bool
    @Binding var groups: [AppUserGroup]
    
    func removeUserFromSelectedUsers(_ user: AppUser) {
        if selectedUsers.contains(user) {
            selectedUsers.remove(at: selectedUsers.firstIndex(of: user)!)
        }
    }
    
    func isUserSelectedAction(_ user: AppUser) {
        if selectedUsers.contains(user) {
            removeUserFromSelectedUsers(user)
        }
    }
    
    func changePage() {
        if pageIndex == .listView {
            pageIndex = .detailsView
        } else {
            pageIndex = .listView
        }
        print(pageIndex)
    }
    
    func finish() {
//        addGroup()
        selectedUsers.removeAll()
        self.showingDetail = false
    }
    
//    func addGroup() {
//        var newGroup: AppUserGroup = AppUserGroup()
//        newGroup.title = titel
//        newGroup.imageName = "sport4"
//        newGroup.id = String(groups.count + 1)
//        groups.append(newGroup)
//    }
    
    func cancel() {
        selectedUsers.removeAll()
        self.showingDetail = false
    }
    
//    init() {
//               UINavigationBar.appearance().tintColor = UIColor.white
//               UINavigationBar.appearance().titleTextAttributes = [
//                   .font : UIFont.systemFont(ofSize: 20),
//                   NSAttributedString.Key.foregroundColor : UIColor.white
//               ]
//           }
    
    var body: some View {
//        NavigationView() {
        VStack() {
            
            // Header Section
            ZStack(){
                HStack() {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        
                            ZStack() {
                                Circle()
                                    .foregroundColor(Color .black)
                                    .frame(width: 29, height: 29)
                                Image(systemName: "chevron.left.circle.fill")
                                    .font(.system(size: 30))
                                    .imageScale(.medium)
                                    .foregroundColor(Color .white)
                                    .frame(width: 30, height: 30)
                            }
                        
//                        Text("Abbrechen")
//                            .font(.system(size: 17))
//                            .fontWeight(.medium)
//                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
//                    Button(action: {
//                        withAnimation(.linear(duration: 0.1)) {
//                            self.changePage()
//                        }
//                    }) {
//                        Text("Weiter")
//                            .font(.system(size: 17))
//                            .fontWeight(.semibold)
//                            //                                .foregroundColor(.black)
//                            .foreground(gradientVioletRoyalblue)
//                    }
                    
                    
//                    NavigationLink(destination:
//                                    GroupDetails(
//                                        pageIndex: self.$pageIndex,
//                                        selectedUsers: self.$selectedUsers,
//                                        showingDetail: self.$showingDetail,
//                                        groups: self.$groups
//                                    )) {
//                            Text("Weiter")
//                                .font(.system(size: 17))
//                                .fontWeight(.medium)
//                                                                .foregroundColor(.black)
////                                .foreground(gradientVioletRoyalblue)
//                    }
                    
                }
                .padding(.horizontal, 16)
                
                HStack() {
                    Spacer()
                    Text("Personen auswählen")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    Spacer()
                }
            }
            .padding(.bottom, 8)
            .padding(.top, 15)
            
            // Searchbutton
            RoundedRectangle(cornerRadius: 12)
                .fill(Color ("super_bright_gray"))
                .frame(height: 38)
                .overlay(
                    HStack() {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(Color ("mid_gray"))
                        
                        Text("Suche")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(Color ("mid_gray"))
                        Spacer()
                    }
                    .padding(.horizontal, 12)
                )
                .padding(.horizontal, 16)
                .padding(.top, 7)
                .padding(.bottom, 3)
            
            // Selected Users
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(selectedUsers, id: \.id) { user in
                        Button(action: {
                            withAnimation(.linear(duration: 0.2)) {
                                self.removeUserFromSelectedUsers(user)
                            }
                        }) {
                            VStack() {
                                ZStack() {
                                    user.image
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                    
                                    ZStack(){
                                        Circle()
                                            .foregroundColor(Color ("bright_gray"))
                                            .frame(width: 24, height: 24)
                                        
                                        Image(systemName: "xmark")
                                            .font(.system(size: 11, weight: .black))
                                            
                                            .imageScale(.medium)
                                            .foregroundColor(Color .black)
                                            .frame(width: 24, height: 24)
//                                    }.offset(x: 19, y: -21)
                                    }.offset(x: 26, y: -28)
                                }
                                .padding(.vertical, 5)
                                
                                Text(user.username)
                                    .font(.systemSemibold(size: 16))
//                                    .fontWeight(.medium)
//                                    .foregroundColor(Color .black)
                                    .foregroundColor(Color ("almost_black"))
                                    .frame(width: 80)
                                    .lineLimit(1)
                            }.padding(.trailing, 10)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.top, 4)
            .padding(.bottom, 3)
            
            // List
            UserList(selectedUsers: self.$selectedUsers)
                .padding(.top, 4)
        }
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
//        }
    }
}

enum UserComponentPageIndex: Int {
    case listView = 0
    case detailsView = 1
}

//struct UserComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        UserComponent()
//    }
//}
