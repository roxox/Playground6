//
//  GroupListRowItem_2.swift
//  Playground6
//
//  Created by Sebastian Fox on 30.10.20.
//

import SwiftUI


var gradient: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors: [Color.black.opacity(0.4), Color.black.opacity(0.1), Color.black.opacity(0.01)]),
        startPoint: .bottom,
        endPoint: .top)
}

struct GroupListRowItem_4: View {
    var appGroup: AppUserGroup
    let testDistances = ["200m", "300m", "350m", "800m", "1km", "2km", "2km", "3km"]
    let itemWidthGroup: CGFloat = 384 //167*2+20+30
    let itemHeightGroup: CGFloat = 280 // 1,648 Ratio // 233
    
    func getRandomDistance() -> String {
        let randomInt = Int.random(in: 0..<testDistances.count)
        return testDistances[randomInt]
    }
    func getRandomName() -> AppUser {
        let randomInt = Int.random(in: 0..<appUserData.count)
        return appUserData[randomInt]
    }
    
    
    
    let colors: [Color] = [.red, .blue, .green, .pink, .yellow, .orange, .purple, Color ("turquoise-1"), Color ("peach"), Color ("violet"), Color ("cherry")]
    
    func getBackgroundColor() -> Color {
        let randomInt = Int.random(in: 0..<colors.count)
        return colors[randomInt]
    }
    
    func getRandomUser() -> AppUser {
        let randomInt = Int.random(in: 0..<appUserData.count)
        return appUserData[randomInt]
    }
    
    var body: some View {
        //        ZStack() {
        
        NavigationLink(destination: GroupDetailView(group: appGroup)) {
            self.appGroup.image
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: itemWidthGroup+16, height: itemHeightGroup)
//                .frame(width: deviceWidth, height: itemHeightGroup)
                .cornerRadius(25)
//                .cornerRadius(0)
                .overlay(
                    ZStack() {
                        gradient
                        //                    Rectangle().fill(self.getBackgroundColor())
                        
                        VStack(alignment: .center) {
                            Spacer()
                            //                        HStack() {
                            //                            Spacer()
                            //                            Text("Los Angeles")
                            //                                .font(.systemSemibold(size: 17))
                            //                                .foregroundColor(.white)
                            //                            Spacer()
                            //                        }
                            
                            HStack() {
                                                            Spacer()
                                Text("Los Angeles")
                                    .font(.systemSemibold(size: 17))
                                    .foregroundColor(.white)
                                Spacer()
                            }
//                            .offset(y: 12)
                            .padding(.leading, 10)
                            
                            //                        HStack() {
                            //                            Spacer()
                            //                            Text(appGroup.title!)
                            //                                .font(.systemSemibold(size: 28))
                            //                                .lineLimit(1)
                            //                                .foregroundColor(.white)
                            //                            Spacer()
                            //                        }
                            
                            HStack() {
                                                            Spacer()
                                Text(appGroup.title!)
                                    .font(.systemBold(size: 28))
                                    .lineLimit(1)
                                    .foregroundColor(.white)
                                Spacer()
                            }
//                            .offset(y: 15)
                            .padding(.leading, 10)
                            
//                            HStack() {
////                                Spacer()
//
//                                getRandomUser().image
//                                    .renderingMode(.original)
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 30, height: 30)
//                                    .clipShape(Circle())
//
//                                Text(getRandomUser().username)
//                                    .font(.systemMedium(size: 15))
//                                    .foregroundColor(.white)
//
//                                Spacer()
//                            }
//                            .padding(.leading, 10)
                            
                            .padding(.bottom, 18)
                            
                            
                            //                    HStack() {
                            //                        Text(appGroup.description!)
                            //                            .font(.systemMedium(size: 14))
                            //                            .lineLimit(2)
                            //                            .foregroundColor(.white)
                            //                        Spacer()
                            //                    }
                            //                    //                    .padding(.bottom, 5)
                            //                    .padding(.leading, 14)
                            
                            
                            
                        }
                    }
                    .cornerRadius(25)
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
