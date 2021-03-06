//
//  UserShowroom_2.swift
//  Playground6
//
//  Created by Sebastian Fox on 30.10.20.
//

import SwiftUI

struct UserShowroom_2: View {
    @EnvironmentObject var menuControl: MenuControl
    
    let testDistances = ["200m", "400m", "450m", "800m", "1km", "2km", "2km", "3km"]
    
    let blurredStroke: VisualEffectView = VisualEffectView(effect: UIBlurEffect(style: .extraLight))
    
    func getRandomDistance() -> String {
        let randomInt = Int.random(in: 0..<testDistances.count)
        return testDistances[randomInt]
    }
    
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.4), Color.black.opacity(0.0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        VStack() {
            
            HStack() {
                
                
                // Selected Users
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .bottom) {
                            VStack() {
                                HStack() {
                                    Circle()
                                        .frame(width: 90, height: 90)
                                        //                                .background(Color ("bright_gray"))
                                        .foregroundColor(Color ("bright_gray"))
//                                        .foregroundColor(Color ("mid_gray"))
//                                        .foreground(gradientTRoyalBlueBlue)
//                                        .shadow(radius: 1, y: 0.3)
                                        .overlay(
                                                Image(systemName: "wand.and.stars")
                                                    .font(.system(size: 26, weight: .bold))
                                                    .imageScale(.large)
                                                    .foregroundColor(Color ("almost_black"))
//                                                    .foreground(gradientTRoyalBlueBlue)
                                                    .frame(width: 26, height: 26)
                                        )
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color .white, lineWidth: 7))
//                                        .overlay(Circle().stroke(Color ("turquoise"), lineWidth: 2))
//                                        .overlay(Circle().stroke(gradientVioletRoyalblue, lineWidth: 2.5))
                                        .overlay(Circle().stroke(gradientTurquoiseBlue, lineWidth: 2.5))
//                                        .overlay(Circle().stroke(gradientPinkPeachPeach, lineWidth: 2.5))
//                                        .overlay(Circle().stroke(Color ("gray-1"), lineWidth: 2.5))
                                    
                                        
                                }
                                .padding(.vertical, 5)

                                Text("Empfehlung")
                                    .font(.systemMedium(size: 16))
                                    .foregroundColor(Color .black)
                                    .frame(width: 64)
                                    .lineLimit(1)
                            }.padding(.trailing, 10)
                        
                        ForEach(appUserData, id: \.id) { user in
                            Button(action: {
                                menuControl.selectedUser = user
                                menuControl.showUserSelectedMenu = true
                                //                            withAnimation(.linear(duration: 0.2)) {
                                //                                self.removeUserFromSelectedUsers(user)
                                //                            }
                            }) {
                                VStack() {
                                    HStack() {
                                        user.image
                                            .renderingMode(.original)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 90, height: 90)
                                            .clipShape(Circle())
//                                            .overlay(Circle().stroke(Color ("mid_gray"), lineWidth: 1))
                                    }
                                    .padding(.vertical, 5)
                                    
                                    VStack()
                                    {
//                                        Spacer()
                                        Text(user.username)
                                            .font(.systemSemibold(size: 16))
                                            .foregroundColor(Color ("almost_black"))
                                            .frame(width: 80)
                                            .lineLimit(1)
//                                            .padding(.bottom, 10)
                                    }
                                }.padding(.trailing, 5)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
//                .padding(.top, 6)
            }
            .padding(.top, 4)
            .padding(.bottom, 7)
//            Rectangle().fill(Color ("bright_gray"))
//                .frame(height: 1.5)
//                .frame(maxWidth: .infinity)
        }
    }
}

//struct UserShowroom_Previews: PreviewProvider {
//    static var previews: some View {
//        UserShowroom()
//    }
//}
