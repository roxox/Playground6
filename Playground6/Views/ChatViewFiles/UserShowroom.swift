//
//  UserShowroom.swift
//  Playground6
//
//  Created by Sebastian Fox on 23.10.20.
//

import SwiftUI


var gradientPinkPeachPeach: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
//                    Color ("cherry"),
                    .pink,
                    Color ("peach"),
                    Color ("peach")
                ]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
}

var gradientBrightGrayMidGray: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
//                    Color ("cherry"),
                    Color ("bright_gray"),
                    Color ("super_bright_gray")
                ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientCherryPeach: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
//                    Color ("cherry"),
                    .pink,
                    Color ("peach")
                ]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
}

struct UserShowroom: View {
    @EnvironmentObject var menuControl: MenuControl
    
    let testDistances = ["200m", "400m", "450m", "800m", "1km", "2km", "2km", "3km"]
    func getRandomDistance() -> String {
        let randomInt = Int.random(in: 0..<testDistances.count)
        return testDistances[randomInt]
    }
    
    var body: some View {
        VStack() {
                        HStack(){
                            Text("Personen")
                                .font(.systemBold(size: 15))
                                .foreground(gradientCherryPeach)
                            Spacer()
                        }.padding(.horizontal, 16)
                        .padding(.top, 10)
            
            HStack() {
                
                
                // Selected Users
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        
                                VStack() {
                                    HStack() {
                                        Circle()
                                            .frame(width: 78, height: 78)
                                            .foregroundColor(Color ("bright_gray"))
                                            .overlay(
                                                    Image(systemName: "wand.and.stars")
                                                        .font(.system(size: 26, weight: .bold))
                                                        .imageScale(.large)
                                                        .foregroundColor(Color .black)
                                                        .frame(width: 26, height: 26)
                                            )
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color .white, lineWidth: 7))
                                            .overlay(Circle().stroke(gradientTRoyalBlueBlue, lineWidth: 2.5))
                                        
                                            
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
                            }) {
                                VStack() {
                                    HStack() {
                                        user.image
                                            .renderingMode(.original)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: sizeCircleExploreView, height: sizeCircleExploreView)
                                            .clipShape(Circle())
                                    }
                                    .padding(.vertical, 5)
                                    
                                    Text(user.username)
                                        .font(.systemSemibold(size: 16))
                                        .foregroundColor(Color ("almost_black"))
                                        .frame(width: 80)
                                        .lineLimit(1)
                                }.padding(.trailing, 5)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .padding(.top, 4)
            .padding(.bottom, 3)
        }
    }
}
