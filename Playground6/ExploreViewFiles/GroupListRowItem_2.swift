//
//  GroupListRowItem_2.swift
//  Playground6
//
//  Created by Sebastian Fox on 30.10.20.
//

import SwiftUI

struct GroupListRowItem_2: View {
    var appGroup: AppUserGroup
    let testDistances = ["200m", "300m", "350m", "800m", "1km", "2km", "2km", "3km"]
    let itemWidthGroup: CGFloat = 384 //167*2+20+30
    let itemHeightGroup: CGFloat = 233 // 1,648 Ratio // 233
    
    func getRandomDistance() -> String {
        let randomInt = Int.random(in: 0..<testDistances.count)
        return testDistances[randomInt]
    }
    func getRandomName() -> AppUser {
        let randomInt = Int.random(in: 0..<appUserData.count)
        return appUserData[randomInt]
    }
    
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.4), Color.black.opacity(0.0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        //        ZStack() {
        
        NavigationLink(destination: GroupDetailView(group: appGroup)) {
        self.appGroup.image
            .renderingMode(.original)
            .resizable()
            .scaledToFill()
            .frame(width: itemWidthGroup, height: itemHeightGroup)
            .cornerRadius(10)
            .overlay(
                ZStack() {
//                    Color .black.opacity(0.2)
                    gradient
                    VStack() {
                        Spacer()
                        HStack() {
                            Text("Los Angeles")
                                .font(.system(size: 17))
                                .foregroundColor(.white)
//                                .fontWeight(.bold)
                            Spacer()
                        }
                        //                    .padding(.bottom, 5)
                        .padding(.leading, 14)
                        
                        HStack() {
                            Text(appGroup.title!)
                                .font(.systemSemibold(size: 20))
                                .lineLimit(2)
                                .foregroundColor(.white)
                            
                        
                        if appGroup.title == "Burger bei Hans im Glück" {
                            Image(systemName: "bolt.fill")
                                .font(.systemSemibold(size: 13))
//                                .imageScale(.medium)
//                                .foreground(gradientTurquoiseBlue)
//                                .foreground(gradientCherryPeach)
//                                .foregroundColor(.gray)
//                                .foreground(.gra)
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                                .offset(y: -1)
                        }
                            //                            .frame(minHeight: 0, maxHeight: .infinity)
                            Spacer()
                        }
                        .padding(.leading, 14)
                        
                        
//                    HStack() {
//                        Text(appGroup.description!)
//                            .font(.systemMedium(size: 14))
//                            .lineLimit(2)
//                            .foregroundColor(.white)
//                        Spacer()
//                    }
//                    //                    .padding(.bottom, 5)
//                    .padding(.leading, 14)
                    
                    .padding(.bottom, 14)
                    
                    }
                }
                .cornerRadius(10)
            )
            .padding(.bottom, 6)
        }
        
        //                HStack() {
        //                    Text("Los Angeles • basti1284")
        //                        .foregroundColor(.white)
        //                        .font(.avenirNextRegular(size: 13))
        //                        .fontWeight(.bold)
        //                        .lineLimit(1)
        //                    Spacer()
        //                }
        //                .frame(width: itemWidthGroup)
        //                .padding(.top, 5)
        //
        //                HStack() {
        //                    Text(appGroup.title!)
        //                        .font(.avenirNextRegular(size: 18))
        //                        .lineLimit(2)
        //                        .foregroundColor(.white)
        //                        .frame(minHeight: 0, maxHeight: .infinity)
        //                    Spacer()
        //                }
        //                .frame(width: itemWidthGroup)
        //                .padding(.bottom, 8)
        //            }
        
    }
    
}

//struct GroupListRowItem_2_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupListRowItem_2()
//    }
//}
