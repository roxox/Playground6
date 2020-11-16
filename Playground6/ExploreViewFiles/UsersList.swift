//
//  UsersList.swift
//  Playground6
//
//  Created by Sebastian Fox on 09.11.20.
//

import SwiftUI

struct UsersList: View {
    
    @Binding var users: [AppUser]
    @Binding var createNewGroup: Bool
    
    @State var selectedUser: AppUser = appUserData[0]
    @State var selectedUsers: [AppUser] = []
    let itemWidthGroup: CGFloat = deviceWidth //167*2+20+30
    let itemHeightGroup: CGFloat = 350 // 1,648 Ratio // 233
    let itemSize: CGFloat = deviceWidth/4 //103.5
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.4), Color.black.opacity(0.0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    func addOrRemove(_ user: AppUser) {
        if !selectedUsers.contains(user) {
            self.addUser(user)
        } else {
            self.removeUser(user)
        }
        
    }
    
    func addUser(_ user: AppUser) {
        if !selectedUsers.contains(user) {
            selectedUsers.append(user)
        }
    }
    
    func removeUser(_ user: AppUser) {
        if selectedUsers.contains(user) {
            selectedUsers.remove(at: selectedUsers.firstIndex(of: user)!)
        }
    }
    
    func getIndexOfItem(_ user: AppUser) -> Int {
        let index = selectedUsers.firstIndex(of: user)
        return index!
    }
    
    func getPositionOfItem(_ user: AppUser) -> Int {
        let index = getIndexOfItem(user)
        let position = index + 1
        return position
    }
    
    func getMissingTiles() -> Int {
        let value = 16 - users.count
        return value
    }
    
    //    func addUser(_ user: AppUser) {
    //        selectedUsers.append(user)
    //    }
    
    var body: some View {
        
        //        Rectangle()
        //            .fill(Color .white)
        //            .frame(height: 10)
        
        
        selectedUser.image
            .renderingMode(.original)
            .resizable()
            .scaledToFill()
            .frame(width: itemWidthGroup, height: itemHeightGroup)
            .overlay(
                ZStack() {
                    gradient
                    
                    VStack(alignment: .center) {
                        Spacer()
                        HStack() {
                            //                                    Spacer()
                            Text("Los Angeles")
                                .font(.systemSemibold(size: 17))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                        HStack() {
                            //                                    Spacer()
                            Text(selectedUser.username)
                                .font(.systemSemibold(size: 28))
                                .lineLimit(1)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            HStack(){
                                Image(systemName: "person.fill")
                                    .font(.system(size: 22, weight: .bold))
                                    .imageScale(.small)
                                    .foregroundColor(.white)
                                    .frame(width: 35, height: 35)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            //                            .background(VisualEffectView(effect: UIBlurEffect(style: .light))
                            //                                            .edgesIgnoringSafeArea(.all)).cornerRadius(25)
                            .background(Color.black.opacity(0.6)).cornerRadius(25)
                            
                            
                            if createNewGroup {
                                Button(action: {
                                    self.addOrRemove(selectedUser)
                                }) {
                                    HStack(){
                                        Image(systemName: !selectedUsers.contains(selectedUser) ? "plus" : "xmark")
                                            .font(.system(size: 22))
                                            .imageScale(.small)
                                            .foregroundColor(.white)
                                            .frame(width: 35, height: 35)
                                    }
                                    .clipShape(Circle())
                                    //                                .background(VisualEffectView(effect: UIBlurEffect(style: .light))
                                    //                                                .edgesIgnoringSafeArea(.all)).cornerRadius(25)
                                    .background(Color.black.opacity(0.6)).cornerRadius(25)
                                }
                            }
                            
                        }
                        
                        .padding(.bottom, 18)
                        
                    }
                    .padding(.horizontal, 16)
                    
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 0))
        
        ScrollView() {
            LazyVGrid(columns: columns, spacing: 1) {
                
                //                        Rectangle()
                //                            .fill(Color .white)
                
                //            selectedUser.image
                //                Image("katha2")
                //                .renderingMode(.original)
                //                .resizable()
                //                .scaledToFill()
                //                .frame(width: itemSize, height: itemSize)
                //                .clipShape(RoundedRectangle(cornerRadius: 0))
                //                .shadow(radius: 0.7, y: 0.5)
                //
                //                .overlay(
                //
                //                    VisualEffectView(effect: UIBlurEffect(style: .dark))
                //                        .edgesIgnoringSafeArea(.all)
                //                )
                //                .overlay(Circle()
                //                            .foregroundColor(Color ("bright_gray"))
                //                            .frame(width: 76, height: 76)
                //                )
                //                .overlay(
                //                    Image(systemName: "wand.and.stars")
                //                        .font(.system(size: 26, weight: .bold))
                //                        .imageScale(.large)
                //                        .foregroundColor(Color ("almost_black"))
                //                        //                                                    .foreground(gradientTRoyalBlueBlue)
                //                        .frame(width: 26, height: 26)
                //                )
                //                .overlay(Circle()
                //                            .stroke(Color .white, lineWidth: 5.5)
                //                            .frame(width: 76, height: 76)
                //                )
                //                .overlay(Circle().stroke(gradientTurquoiseBlue, lineWidth: 2.5)
                //                            .frame(width: 80, height: 80))
                
                //            ScrollView() {
                
                ForEach(users, id: \.self) { user in
                    
                    Button(action: {
                        self.selectedUser = user
                        //                    self.addOrRemove(user)
                    }) {
                        user.image
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .frame(width: itemSize, height: itemSize)
                            //                                                .clipShape(Circle())
                            .clipShape(RoundedRectangle(cornerRadius: 0))
                            .overlay(Color.white.opacity(self.selectedUser == user ? 0.6 : 0.0))
                            .overlay(
                                //                            if selectedUsers.contains(user) {
                                VStack() {
                                    HStack() {
                                        Spacer()
                                        
                                        if createNewGroup {
                                            Button(action: {
                                                self.addOrRemove(user)
                                            }) {
                                                ZStack(){
                                                    
                                                    //                                            if selectedUsers.contains(user){
                                                    Image(systemName: "circle.fill")
                                                        .font(.system(size: 19))
                                                        .imageScale(.medium)
                                                        .foregroundColor(selectedUsers.contains(user) ? Color.white.opacity(1) : Color.white.opacity(0.4))
                                                        .frame(width: 20, height: 20)
                                                    //                                            }
                                                    
                                                    Image(systemName: "circle")
                                                        .font(.system(size: 21))
                                                        .imageScale(.medium)
                                                        .foregroundColor(selectedUsers.contains(user) ? Color.blue.opacity(1) : Color.white.opacity(1))
                                                        .frame(width: 20, height: 20)
                                                    
                                                    if selectedUsers.contains(user){
                                                        //                                            Image(systemName: "\(self.getPositionOfItem(user)).circle.fill")
                                                        Image(systemName: "checkmark.circle.fill")
                                                            .font(.system(size: 19))
                                                            .foreground(Color.blue)
                                                    }
                                                }
                                                .padding(5)
                                            }
                                        }
                                    }
                                    Spacer()
                                }
                                //                            }
                            )
                        
                        //                        .shadow(radius: 2, y: 1)
                    }
                }
                
                ForEach(0..<getMissingTiles()) { i in
                    Rectangle()
                        .fill(Color ("super_bright_gray"))
                        .frame(width: itemSize, height: itemSize)
                }
            }
        }
        //        }
        //        .padding(.horizontal, 1)
        .offset(y: -7)
    }
}

//struct UsersList_Previews: PreviewProvider {
//    static var previews: some View {
//        UsersList()
//    }
//}
