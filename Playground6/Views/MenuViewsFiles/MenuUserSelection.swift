//
//  UserSelectedMenu.swift
//  Playground6
//
//  Created by Sebastian Fox on 28.10.20.
//

import SwiftUI

struct MenuUserSelection: View {
    @EnvironmentObject var menuControl: MenuControl
    @State private var scrollViewID = UUID()
    @State private var showCategories = false
    @State private var showUserProfile = false
    @Binding var isSearchActive: Bool
    @Binding var selectedUser: AppUser?
    
    func closeMenu() {
        self.menuControl.showUserSelectedMenu.toggle()
        scrollViewID = UUID()
    }
    
    var body: some View {
        VStack() {
            Spacer()
            VStack() {
                ZStack(alignment: .top){
                    
                    HStack(alignment: .top) {
                        Spacer()
                        Button(action: {
                            self.closeMenu()
                        }) {
                            ZStack() {
                                Circle()
                                    .foregroundColor(Color .black)
                                    .frame(width: 23, height: 23)
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 24))
                                    .imageScale(.medium)
                                    .foregroundColor(Color ("bright_gray"))
                                    .frame(width: 24, height: 24)
                            }
                        }
                    }.padding(.horizontal, 16)
                    
                        
                        VStack(alignment: .leading) {
                            HStack() {
//                                Spacer()
//                            if selectedUser != nil {
//                                self.selectedUser!.image
//                                .renderingMode(.original)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 60, height: 60)
//                                .clipShape(Circle())
//                            }
                            Text(selectedUser?.username ?? "NO USER SELECTED")
                                .font(.systemSemibold(size: 18))
//                                .fontWeight(.semibold)
                                
                            Spacer()
                            }.padding(.leading, 16)
                        }
                    
//                    HStack() {
//                        Text(selectedUser?.username ?? "NO USER SELECTED")
//                            .font(.system(size: 18))
//                            .fontWeight(.bold)
//                    }
                }
                .padding(.top, 10)
                .padding(.top, 9)
                
                Group() {
                    Button(action: {
                        withAnimation(.linear(duration: 0.2)) {
                            self.showUserProfile.toggle()
                        }
                    }) {
                        HStack(){
                            //                        Spacer()
                            Image(systemName: "person.fill")
                                .font(.system(size: 20, weight: .bold))
                                .imageScale(.medium)
                                .foregroundColor(.black)
                                .frame(width: 40, height: 40)
                            
                            ZStack(){
                                HStack() {
                                    VStack(alignment: .leading) {
                                        Text("Profil anzeigen")
                                            .font(.systemMedium(size: 18))
                                            .foregroundColor(.black)
//                                            .fontWeight(.medium)
                                        
                                        //                                    Text("Las Vegas +25km")
                                        //                                        .font(.system(size: 12))
                                        //                                        .fontWeight(.medium)
                                        //                                        .foregroundColor(.black)
                                    }
                                    Spacer()
                                }
                                Rectangle()
                                    .frame(height: 0.5)
                                    .foregroundColor(Color ("bright_gray"))
                                    .offset(y: 34)
                            }
                        }
                    }.sheet(isPresented: $showUserProfile) {
//                        NewGroupView(showingDetail: self.$showingDetail,
//                                     groups: $groups)
                        UserProfileView(showUserProfile: $showUserProfile, user: selectedUser)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
                    .padding(.bottom, 4)
                    .padding(.top, 10)
                    
                    HStack(){
                        Image(systemName: "gamecontroller.fill")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                        
                        ZStack(){
                            HStack() {
                                Button(action: {
                                    withAnimation(.linear(duration: 0.2)) {
                                        self.showCategories.toggle()
                                    }
                                }) {
                                    VStack(alignment: .leading) {
                                        Text("Gruppe erstellen")
                                            .font(.systemMedium(size: 18))
                                            .foregroundColor(.black)
//                                            .fontWeight(.medium)
                                        
                                        //                                        Text("Essen & Trinken, Entertainment, Sport, Nachbarschaftshilfe")
                                        //                                            .font(.system(size: 12))
                                        //                                            .fontWeight(.medium)
                                        //                                            .foregroundColor(.black)
                                        //                                            .lineLimit(1)
                                        
                                    }
                                    .background(Color.white)
                                }
                                Spacer()
                            }
                        }
                    }.padding(.horizontal, 16)
                    .padding(.vertical, 4)
                    .padding(.top, 4)
                    .padding(.bottom, 20)
                }
                
            }.background(Color .white)
            .cornerRadius(15)
        }
    }
}

//struct UserSelectedMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        UserSelectedMenu()
//    }
//}
