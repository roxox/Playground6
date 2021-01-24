//
//  UsersView.swift
//  Playground6
//
//  Created by Sebastian Fox on 13.11.20.
//

import SwiftUI

struct GroupsMainView: View {
    
    @Binding var users: [AppUser]
    @State var backColor: Color = Color.black
    @State var foreColor: Color = Color.white
    @State var buttonBackColor: Color = Color ("almost_black")
    @State var selectedUser: AppUser = appUserData[0]
    
    
    let circleSize: CGFloat = 25
    
    @Binding var entertain: Bool
    @Binding var food: Bool
    @Binding var sport: Bool
    @Binding var search: Bool
    @Binding var isCircle: Bool
    
    func toggleColor() {
        if backColor == .black {
            backColor = Color.white
            foreColor = .black
            buttonBackColor = Color ("bright_gray")
        } else {
            backColor = .black
            foreColor = .white
            buttonBackColor = Color ("almost_black")
        }
    }
    
    func showSearchButton() -> Bool {
        if food == false && entertain == false && sport == false {
            return false
        }
        return true
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            LazyVStack {
                Group() {
                    
                    
                    Rectangle()
                        .fill(Color .clear)
                        .frame(height: 20)
                    
                    HStack(alignment: .center) {
                        Text("Worauf hast du Lust, \(selectedUser.firstname)?")
                            .font(.systemMedium(size: 26))
                            .foregroundColor(foreColor)
                            .lineLimit(1)
                    }
                    //Alt
                    //                    .padding(.top, 40)
                    //Neu
                    .padding(.top, 40)
//                    .padding(.bottom, 24)
                    .padding(.bottom, 15)
                    
                    
                    HStack(alignment: .top){
                        Spacer()
                        Button(action: {
                            withAnimation(.linear(duration: 0.1)) {
                                //                                self.changePage()
                                self.isCircle.toggle()
                            }
                        }) {
                            HStack() {
                                Image(systemName: "magnifyingglass")
                                    .font(.systemBold(size: 17))
                                    .imageScale(.medium)
                                    .foregroundColor(foreColor)
                                    .frame(width: 22, height: 22)
                            }
                        }
                    }
                    //Alt
                    //                    .padding()
                    
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                
            
            GroupsGroupsWidget()
                .padding(.bottom, 5)
                
//                Group() {
//                    GroupsListView(users: $users, appGroup: appGroupData[5], hardUsers: [appUserData[5],appUserData[2],appUserData[3],appUserData[1],appUserData[4]])
//                        .padding(.bottom, 5)                      .padding(.bottom, 5)
//                }
                
                GroupsUserWidget(users: $users)
                    .padding(.bottom, 5)
                
                GroupsRecommendationWidget()
                    .padding(.bottom, 5)
//                
//                appGroupData[5].image
//                    .renderingMode(.original)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: deviceWidth, height: 330)
//                    .overlay(
//                        ZStack() {
//                            centerGradientInverted
//                            
//                            VStack() {
//                                HStack {
//                                    VStack(alignment: .leading) {
//                                    Text("Vorschläge")
//                                        .font(.systemExtrabold(size: 23))
//                                        .foregroundColor(Color.white)
//                                        .lineLimit(1)
//                                    }
//                                    Spacer()
//                                    }
//                                .padding(.horizontal, 25)
//                                .padding(.top, 25)
//                                
//                            Spacer()
//                            }
//                        }
//                    )
//                    .cornerRadius(25)
//                    .padding(.bottom, 5)
                
                GroupsChatWidget(users: $users)
                    .padding(.bottom, 5)
            
                appUserData[0].image
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: deviceWidth, height: 350)
                    .overlay(
                        ZStack() {
                            centerGradientInverted
                            
                            VStack() {
                                HStack {
//                                        )
                                    VStack(alignment: .leading) {
                                    Text(selectedUser.firstname)
                                        .font(.systemBold(size: 26))
//                                        .font(.systemExtrabold(size: 23))
                                        .foregroundColor(Color.white)
                                        .lineLimit(1)
                                    }
                                    Spacer()
                                    }
                                .padding(.horizontal, 25)
                                .padding(.top, 25)
                                
                            Spacer()
                                
                                
                                
                                HStack() {
                                    Spacer()
                                    HStack() {
                                        Text("Ansehen und erstellen")
                                            .font(.systemBold(size: 16))
                    //                        .underline()
                                            .foregroundColor(.white)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 12)
                                    }
                                    .background(Color.black.opacity(0.4))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color .white, lineWidth: 1))
                                    Spacer()
                                }
                                .padding(.bottom, 25)
//                                Spacer()
                            }
                        }
                    )
                    .cornerRadius(25)
                
//                GroupsListView(users: $users, appGroup: appGroupData[3], hardUsers: [appUserData[3],appUserData[4],appUserData[5]])
//                    .padding(.bottom, 5)
//
//                GroupsListView(users: $users, appGroup: appGroupData[1], hardUsers: [appUserData[0],appUserData[1],appUserData[2]])
//                    .padding(.bottom, 5)
                
                Rectangle()
                    .fill(Color .clear)
                    .frame(height: 30)
//
//                Button(action: {
//                    withAnimation(.linear(duration: 0.1)) {
//                        //                                self.changePage()
//                        self.toggleColor()
//                    }
//                }) {
//                    Text("Change Color")
//                        .foregroundColor(.blue)
//                }
//
//                Rectangle()
//                    .fill(Color .clear)
//                    .frame(height: 100)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(backColor)
    }
}
