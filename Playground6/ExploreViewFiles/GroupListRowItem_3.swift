//
//  GroupListRowItem.swift
//  Playground6
//
//  Created by Sebastian Fox on 23.10.20.
//

import SwiftUI

struct GroupListRowItem_3: View {
    var appGroup: AppUserGroup
    let testDistances = ["200m", "300m", "350m", "800m", "1km", "2km", "2km", "3km"]
    func getRandomDistance() -> String {
        let randomInt = Int.random(in: 0..<testDistances.count)
        return testDistances[randomInt]
    }
    func getRandomName() -> AppUser {
        let randomInt = Int.random(in: 0..<appUserData.count)
        return appUserData[randomInt]
    }
    
    var body: some View {
        
        NavigationLink(destination: GroupDetailView(group: appGroup)) {
        HStack {
            ZStack(){
                self.appGroup.image
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: sizeRoundedRectangelExploreView * 1.2, height: sizeRoundedRectangelExploreView)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
//                    .shadow(radius: 1, y: 0.5)
            }
            
            ZStack(){
                HStack() {
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Text(appGroup.title!)
                            .font(.systemSemibold(size: 20))
                            .foregroundColor(Color ("almost_black"))
//                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .padding(.leading, 5)
                            .offset(y: -1)
                        
                        if appGroup.title == "Burger bei Hans im Glück" {
                            Image(systemName: "bolt.fill")
                                .font(.systemSemibold(size: 15))
//                                .imageScale(.medium)
//                                .foreground(gradientTurquoiseBlue)
                                .foreground(gradientTurquoiseBlue)
//                                .foregroundColor(.gray)
//                                .foreground(.gra)
                                .frame(width: 15, height: 15)
                                .offset(y: -1)
                        }
                        }
                        
                        
                        HStack() {
                            Text("Los Angeles, \(getRandomDistance()) • ")
//                            Text("Los Angeles, \(getRandomDistance())")
//                                .font(.system(size: 14))
                                .font(.system(size: 17))
                                .foregroundColor(Color ("gray-1"))
//                                .fontWeight(.light)
                                +

                                Text(getRandomName().username)
                                .font(.systemSemibold(size: 17))
                                .foregroundColor(Color ("gray-1"))
//                                .fontWeight(.light)
                        }
                        .lineLimit(1)
                        .padding(.horizontal, 5)
                        .offset(y: 1)
                    }
                    Spacer()
                }
                
//                Rectangle()
//                    .frame(height: 0.7)
//                    .foregroundColor(Color ("bright_gray"))
//                    .offset(y: 44)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 7)
        }
    }
}

//struct GroupListRowItem_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupListRowItem()
//    }
//}
