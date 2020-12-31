//
//  UserList3.swift
//  Playground6
//
//  Created by Sebastian Fox on 23.11.20.
//

import SwiftUI

struct UsersList3: View {
    
    @Binding var users: [AppUser]
    @Binding var createNewGroup: Bool
    
    @State var selectedUser: AppUser = appUserData[0]
    let itemWidth: CGFloat = (deviceWidth-30)/2
    let itemHeight: CGFloat = (deviceWidth-30)/2*1.35
    
    var fixedLayout: [GridItem] {
        [
            .init(.fixed((deviceWidth-30)/2)),
            .init(.fixed((deviceWidth-30)/2))
        ]
    }
    
    let colors: [Color] = [.red, .blue, .green, .pink, .yellow, .orange, .purple, Color ("turquoise-1"), Color ("peach"), Color ("violet"), Color ("cherry")]
    
    func getBackgroundColor() -> Color {
        let randomInt = Int.random(in: 0..<colors.count)
        return colors[randomInt]
    }
    
    var body: some View {
        
//        NavigationView {
            
            ScrollView {
                Rectangle()
                    .fill(Color .white)
                    .frame(height: 20)
                
//                HStack() {
//                    Text("\(users.count) Treffer zu deiner Suche")
//                        .font(.systemMedium(size: 18))
//                }
                
//                HStack() {
//                    Text("User in der Nähe")
//                        .font(.systemBold(size: 36))
//                }
                
                Rectangle()
                    .fill(Color .white)
                    .frame(height: 10)
                
                LazyVGrid(columns: fixedLayout) {
                    ForEach(users, id: \.self) { user in
                        
                            user.image
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                                .frame(width: itemWidth, height: itemHeight)
                                .cornerRadius(15)
                                
                                .overlay(
                                    ZStack() {
                                        VStack() {
                                        gradient
//                                            Spacer()
//                                            Rectangle().fill(self.getBackgroundColor()).frame(height: 65)
                                        }
                                        
                                        VStack(alignment: .center) {
                                            Spacer()
                                            HStack() {
                                                Text("Los Angeles")
                                                    .font(.systemBold(size: 12))
                                                    .foregroundColor(.white)
                                                Spacer()
                                            }
                                            
                                            HStack() {
                                                Text(user.username)
                                                    .font(.systemMedium(size: 17))
                                                    .lineLimit(1)
                                                    .foregroundColor(.white)
                                                Spacer()
                                            }
                                        
                                        .padding(.bottom, 14)
                                        
                                        }
                                        .padding(.leading, 14)
                                    }
                                    .cornerRadius(15)
                                )
                    }
                }
                
                Rectangle()
                    .fill(Color .white)
                    .frame(height: 60)
            }
            .padding(.horizontal, 5)
//        }
    }
}

//struct UsersList3_Previews: PreviewProvider {
//    static var previews: some View {
//        UsersList3()
//    }
//}
