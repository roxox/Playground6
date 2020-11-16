//
//  UsersList.swift
//  Playground6
//
//  Created by Sebastian Fox on 09.11.20.
//

import SwiftUI

struct UsersList2: View {
    
    @Binding var users: [AppUser]
    
    @State var selectedUser: AppUser = appUserData[0]
    let itemWidthGroup: CGFloat = 384 //167*2+20+30
    let itemHeightGroup: CGFloat = 300 // 1,648 Ratio // 233
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.4), Color.black.opacity(0.0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        
        Rectangle()
            .fill(Color .white)
            .frame(height: 20)
            
        
        selectedUser.image
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(height: itemHeightGroup)
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
        //                                .fontWeight(.bold)
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
                                        .font(.system(size: 16, weight: .bold))
                                        .imageScale(.medium)
                                        .foregroundColor(.white)
                                        .frame(width: 16, height: 30)
                                    
                                    Text("Profil")
                                        .font(.systemMedium(size: 15))
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .background(VisualEffectView(effect: UIBlurEffect(style: .light))
                                    .edgesIgnoringSafeArea(.all)).cornerRadius(20)
                                    
                                    
                                HStack(){
                                    Image(systemName: "person.3.fill")
                                        .font(.system(size: 16, weight: .bold))
                                        .imageScale(.medium)
                                        .foregroundColor(.white)
                                        .frame(width: 25, height: 30)
                                    
                                    Text("Gruppe")
                                        .font(.systemMedium(size: 15))
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .background(VisualEffectView(effect: UIBlurEffect(style: .light))
                                    .edgesIgnoringSafeArea(.all)).cornerRadius(20)
                                }
                            
                            .padding(.bottom, 18)
                            
                            }
                            .padding(.horizontal, 16)

                        }
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    .shadow(radius: 2, y: 1)
                    
        
        
        Rectangle()
            .fill(Color .white)
            .frame(height: 30)
        
        HStack() {
            Text("Personen in der Nähe")
                .font(.systemBold(size: 18))
            Spacer()
        }
        .padding(.horizontal, 16)
        
        LazyVGrid(columns: columns, spacing: 10) {
            
            Rectangle()
                .fill(Color ("super_bright_gray"))
                .frame(width: 123, height: 123)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 0.7, y: 0.5)
                
                .overlay(Circle()
                            .foregroundColor(Color ("bright_gray"))
                            .frame(width: 76, height: 76)
                )
                .overlay(
                        Image(systemName: "wand.and.stars")
                            .font(.system(size: 26, weight: .bold))
                            .imageScale(.large)
                            .foregroundColor(Color ("almost_black"))
//                                                    .foreground(gradientTRoyalBlueBlue)
                            .frame(width: 26, height: 26)
                )
                .overlay(Circle()
                            .stroke(Color .white, lineWidth: 5.5)
                            .frame(width: 76, height: 76)
                )
                .overlay(Circle().stroke(gradientTurquoiseBlue, lineWidth: 2.5)
                            .frame(width: 80, height: 80))
            
            
            ForEach(users[0...4], id: \.self) { user in
                
                    Button(action: {
                        self.selectedUser = user
                    }) {
                    user.image
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 123, height: 123)
//                        .clipShape(Circle())
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 2, y: 1)
                    }
            }
        }
        .padding(.horizontal, 16)
    }
}

//struct UsersList_Previews: PreviewProvider {
//    static var previews: some View {
//        UsersList()
//    }
//}
