//
//  UserList3.swift
//  Playground6
//
//  Created by Sebastian Fox on 23.11.20.
//

import SwiftUI

struct UsersListView: View {
    
    @Binding var users: [AppUser]
    
    @State var selectedUser: AppUser = appUserData[0]
    let itemWidth: CGFloat = (deviceWidth-30)/2
    let itemHeight: CGFloat = (deviceWidth-30)/2*1.35
    
    var fixedLayout: [GridItem] {
        [
            .init(.fixed((deviceWidth-30)/2)),
            .init(.fixed((deviceWidth-30)/2))
        ]
    }
    
    var body: some View {
            
            ScrollView {
                Rectangle()
                    .fill(Color .white)
                    .frame(height: 10)
                
//                Rectangle()
//                    .fill(Color .white)
//                    .frame(height: 10)
                
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
