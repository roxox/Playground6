//
//  GroupsChatWidget.swift
//  Playground6
//
//  Created by Sebastian Fox on 16.01.21.
//

import SwiftUI

struct GroupsChatWidget: View {
    @Binding var users: [AppUser]
    
    let itemWidth: CGFloat = (deviceWidth-30)/6
    let itemHeight: CGFloat = (deviceWidth-30)/4*1.35+10
    let circleSize: CGFloat = 25
    
    var body: some View {
        VStack() {
            HStack(alignment: .bottom) {
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(gradientPinkOrange)
//                    .frame(width: circleSize, height: circleSize)
//                    .overlay(
//                        Image(systemName: "envelope.fill")
//                            .font(.systemMedium(size: 14))
//                            .imageScale(.medium)
//                            .foregroundColor(.white)
//                            .frame(width: 25, height: 25)
//                    )
                    Text("Nachrichten")
                        .font(.systemExtrabold(size: 26))
//                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                
                Spacer()
//                Text("Alle anzeigen")
//                    .font(.systemBold(size: 15))
//                    .underline()
//                    .foregroundColor(.black)
//                    .offset(y: -2)
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack() {
                    ForEach(users[0...3], id: \.self) { user in
                        HStack() {
                            //                    VStack() {
                            
                            // 1. Bild
                            user.image
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                                //                            .frame(width: itemWidth, height: itemHeight)
                                .frame(width: itemWidth, height: itemWidth)
                                .overlay(
                                    gradient
                                )
                                .cornerRadius(27)
                            
                            // 2. User und Text
                            VStack(alignment: .leading) {
//                                HStack(alignment: .center) {
                                HStack() {
                                    Text(user.username)
                                        .font(.systemBold(size: 17))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color ("almost_black"))
                                        .lineLimit(1)
                                    //                            Spacer()
                                    Spacer()
                                    
                                    Text("Gestern")
                                        .font(.systemBold(size: 15))
//                                        .fontWeight(.medium)
                                        .foregroundColor(Color.gray)
                                        .lineLimit(1)
//                                }
                                }
                                
                                    Text("Hier koennte Ihr text stehen. Zur Zeit ist es nur ein Beispieltext.")
                                        .font(.system(size: 14))
//                                        .fontWeight(.medium)
                                        .foregroundColor(Color.gray)
                                        .lineLimit(2)
                                        .padding(.trailing, 10)
                                
                                Spacer()
                                
                            }
                            .padding(.top, 5)
                            .padding(.leading, 5)
                            //                        .padding(.leading, 1)
                            //                    }
                            //                    .padding(.bottom, 15)
                            //                    .padding(.trailing, 1)
                            
//                            Spacer()
//
//                            // 3. Uhrzeit oder Tag
//                            VStack(alignment: .trailing) {
//                                Text("Gestern")
//                                    .font(.systemMedium(size: 16))
//                                    .fontWeight(.medium)
//                                    .foregroundColor(Color.gray)
//                                    .lineLimit(2)
//
//                                Spacer()
//                            }
//                            .padding(.top, 5)
//                            .padding(.leading, 15)
                        }
//                        .padding(.top, 5)
                        
//                        Divider()
                    }
                }
                .padding(.horizontal, 25)
            }
            
//            HStack() {
//                Text("Alle anzeigen")
//                    .font(.systemBold(size: 15))
//                    .underline()
//                    .foregroundColor(.black)
//                    .padding(.top, 15)
//            }
            
            HStack() {
//                Spacer()
                HStack() {
                    Text("Alle anzeigen")
                        .font(.systemBold(size: 16))
                        //                        .underline()
                        .foregroundColor(.black)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 10)
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color .black, lineWidth: 1))
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.top, 15)
            
        }
        .padding(.bottom, 25)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(radius: 5)
        .edgesIgnoringSafeArea(.all)
    }
}

//struct GroupsUserWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsUserWidget()
//    }
//}
