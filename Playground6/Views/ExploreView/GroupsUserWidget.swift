//
//  GroupsUserWidget.swift
//  Playground6
//
//  Created by Sebastian Fox on 15.01.21.
//

import SwiftUI

struct GroupsUserWidget: View {
    @Binding var users: [AppUser]
    
    let itemWidth: CGFloat = (deviceWidth-30)/4
    let itemHeight: CGFloat = (deviceWidth-30)/4*1.35+10
    let circleSize: CGFloat = 25
    
    var body: some View {
        VStack() {
            HStack(alignment: .bottom) {
                Text("Find Like-minded people")
                    .font(.systemBold(size: 26))
                    .foregroundColor(Color.black)
                    .lineLimit(2)
                
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack() {
                    ForEach(users[0...4], id: \.self) { user in
                        
                        VStack() {
                            user.image
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                                .frame(width: itemWidth, height: itemWidth)
                                .overlay(
                                    gradient
                                )
                                .cornerRadius(39)
                            
                            HStack(alignment: .center) {
                                Text(user.username)
                                    .font(.systemBold(size: 16))
                                    .foregroundColor(Color.black)
                                    .lineLimit(1)
                            }
                        }
                        .padding(.top, 5)
                        .padding(.trailing, 1)
                        
                    }
                    VStack() {
                       RoundedRectangle(cornerRadius: 39)
                                    .stroke(Color .black, lineWidth: 1)
                                    .frame(width: itemWidth, height: itemWidth-2)
                                    .background(Color ("super_bright_gray")).cornerRadius(39)
                        .overlay(
                            VStack() {
                                Spacer()
                                HStack() {
                                Text("5 weitere")
                                    .font(.systemBold(size: 16))
                                    .foregroundColor(Color .black)
                                    .padding(.leading, 15)
                                    .padding(.bottom, 10)
                                    Spacer()
                                }
                            }
                        )
                        
                        HStack() {
                        Text("Alle anzeigen")
                            .font(.systemBold(size: 16))
                            .foregroundColor(Color .white)
                            .frame(width: itemWidth)
                            .lineLimit(1)
                        }
                    }
                }
                .padding(.horizontal, 25)
                
                
            }
            
            
            
            HStack() {
                HStack() {
                    Text("Alle 10 Benutzer anzeigen")
                        .font(.systemBold(size: 16))
                        .foregroundColor(.black)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 10)
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color .black, lineWidth: 1))
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.top, 20)
        }
        .padding(.bottom, 25)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(radius: 5)
        .edgesIgnoringSafeArea(.all)
    }
}
