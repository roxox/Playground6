//
//  UserList3.swift
//  Playground6
//
//  Created by Sebastian Fox on 23.11.20.
//

// TODO:

// 1. View für 4x4 Matrix für User oder Placeholder
// 2. View für jedes Event (Image wenn verfügbar, Titel, Zeit, Ort, Buttons, TabView -> [4x4 Matrix (USERS CHUNK)])
// 3. List für alls Events
// 4. TabView für Events und User
import SwiftUI
import WaterfallGrid

struct GroupsListView: View {
    
    let itemWidth: CGFloat = (deviceWidth-30)/4
    let itemHeight: CGFloat = (deviceWidth-30)/4*1.4
    //    let itemHeight: CGFloat = (deviceWidth-30)/4*1.35
    let itemWidthGroup: CGFloat = deviceWidth - 30 //384 //167*2+20+30
    //    let itemWidthGroup: CGFloat = deviceWidth //384 //167*2+20+30
    let itemHeightGroup: CGFloat = 240 // 1,648 Ratio
    let circleSize: CGFloat = 28
    
    let numberOfGroups = 4
    
    @State var selectedUser: AppUser = appUserData[0]
    @State var currentPage = 0
    @State var displayedItemIndex = 0
    @State var displayedCurrentItemIndex = 0
    
    @Binding var users: [AppUser]
    
    var appGroup: AppUserGroup
    var hardUsers: [AppUser]
    
    // TESTVALUES AND FUNCTIONS
    let testDistances = ["200m", "300m", "350m", "800m", "1km", "2km", "2km", "3km"]
    
    func getRandomName() -> AppUser {
        let randomInt = Int.random(in: 0..<appUserData.count)
        return appUserData[randomInt]
    }
    // #######################
    
    func getRandomDistance() -> String {
        let randomInt = Int.random(in: 0..<testDistances.count)
        return testDistances[randomInt]
    }
    
    var body: some View {
        
        VStack() {
            NavigationLink(destination: GroupDetailView(group: appGroup)) {
                
                HStack(alignment: .bottom) {
                    Spacer()
                    Text("Finde Gruppen in der Nähe")
//                        .underline()
                        .font(.systemBold(size: 23))
                        .foregroundColor(Color.black)
                        .lineLimit(1)
//                    }
                    Spacer()
                    
//                        HStack() {
//                            Text("Alle anzeigen")
//                                .font(.systemBold(size: 16))
//                                //                        .underline()
//                                .foregroundColor(.black)
//                                .padding(.vertical, 6)
//                                .padding(.horizontal, 10)
//                        }
//                        .clipShape(RoundedRectangle(cornerRadius: 8))
//                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color .black, lineWidth: 2))
                    
                }
                .padding(.top, 25)
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
            }
            
            NavigationLink(destination: GroupDetailView(group: appGroup)) {
                VStack() {
                    
                    PageView([
                        
                        ItemSelectionView(viewIndex: .users,
                                          item: .image,
                                          appGroup: appGroup
                        ),
                        ItemSelectionView(viewIndex: .users,
                                          item: .map,
                                          appGroup: appGroup
                        )
                        
                    ], currentPage: $displayedItemIndex)
                    .frame(width: deviceWidth)
                    .frame(height: itemHeightGroup + 5)
//                    .padding(.bottom, 3)
//                    .padding(.bottom, 11)
                    .padding(.bottom, 10)
                }
                .padding(.top, 2)

            }
            .buttonStyle(PlainButtonStyle())
            
            HStack() {
                VStack() {
                    Divider()
                }
                Text("oder")
                    .font(.systemMedium(size: 15))
                    .foregroundColor(Color ("gray-1"))
                    .lineLimit(2)
                VStack() {
                    Divider()
                }
            }
            .padding(.bottom, 10)
            .padding(.horizontal, 15)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack() {
                    ForEach(appGroupData[0...3], id: \.self) { group in
                        VStack() {
                            group.image
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                                //                                .frame(width: itemWidth, height: itemHeight)
                                .frame(width: itemHeight, height: itemWidth)
                                .overlay(
                                    
                                    ZStack() {
                                        gradient
                                    }
                                )
                                .cornerRadius(14)
                                Text(group.title!)
                                    .font(.systemMedium(size: 16))
                                    .foregroundColor(Color .black)
                                    .frame(width: itemHeight)
                                    .lineLimit(1)
                        }
                        .padding(.trailing, 1)
                    }
                    VStack() {
                       RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color .black, lineWidth: 1)
                                    .frame(width: itemHeight, height: itemWidth-2)
                                    .background(Color ("super_bright_gray")).cornerRadius(14)
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
                            .frame(width: itemHeight)
                            .lineLimit(1)
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
            HStack() {
//                Spacer()
                HStack() {
                    Text("Alle anzeigen")
                        .font(.systemBold(size: 16))
                        //                        .underline()
                        .foregroundColor(.black)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color .black, lineWidth: 2))
                Spacer()
            }
            .padding(.top, 15)
            .padding(.horizontal, 15)
        }
        .padding(.bottom, 25)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(radius: 5)
        .edgesIgnoringSafeArea(.all)
    }
}



enum ItemType: Int {
    case image = 1
    case map = 2
}

struct ItemSelectionView: View {
    let viewIndex: ViewIndex!
    let item: ItemType!
    let appGroup: AppUserGroup!
    let itemWidthGroup: CGFloat = deviceWidth - 30 //384 //167*2+20+30
    //    let itemWidthGroup: CGFloat = deviceWidth //384 //167*2+20+30
    let itemHeightGroup: CGFloat = 240 // 1,648 Ratio
    
    var body: some View {
        VStack() {
            if item == .image {
                appGroup.image
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: itemWidthGroup, height: itemHeightGroup)
                    .overlay(
                        ZStack() {
                            centerGradient
                            
                            VStack() {
                                Spacer()
                                HStack() {
                                Text(appGroup.title!)
                                    .font(.systemMedium(size: 30))
                                    .foregroundColor(Color .white)
                                    .lineLimit(2)
                                }
                                .padding(.bottom, 2)
                                
                                
                                HStack() {
                                    Text("Los Angeles")
                                        .font(.systemMedium(size: 18))
                                        .foregroundColor(Color .white)
                                        .lineLimit(2)
                                }
                                .padding(.bottom, 25)
                            }
                            .padding(.horizontal, 10)
                        }
                    )
                    
                    .cornerRadius(25)
                    .padding(.bottom, 5)
                    .padding(.horizontal)
                    .tag(0)
            } else  if item == .map {
                MapView(coordinate: appUserData[1].searchParameter.locationCoordinate)
                    .disabled(true)
                    //                            .edgesIgnoringSafeArea(.top)
                    .frame(width: itemWidthGroup, height: itemHeightGroup)
                    .cornerRadius(25)
                    .padding(.bottom, 5)
                    .padding(.horizontal)
                    .tag(1)
            } else {
                Text("Illegal State")
            }
        }
        .frame(width: deviceWidth)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .buttonStyle(PlainButtonStyle())
    }
}
