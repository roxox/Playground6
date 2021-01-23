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
    
    // FOR TESTING
    //    @State var entertain: Bool = false
    //    @State var food: Bool = false
    //    @State var sport: Bool = false
    //    @State var search: Bool = false
    //    @State var isCircle: Bool = true
    
    @Binding var entertain: Bool
    @Binding var food: Bool
    @Binding var sport: Bool
    @Binding var search: Bool
    @Binding var isCircle: Bool
    
    func toggleColor() {
        if backColor == .black {
            //            backColor = Color ("bright_gray")
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
                    .padding(.top, 60)
//                    .padding(.bottom, 24)
                    .padding(.bottom, 15)
                    
                    //Alt
                    //                    Rectangle()
                    //                        .fill(Color .clear)
                    //                        .frame(height: 25)
                    
//                    if isCircle != true {
//                        HStack(alignment: .top){
//
//                            Button(action: {
//                                withAnimation(.linear(duration: 0.1)) {
//                                    //                                self.changePage()
//                                    self.food.toggle()
//                                }
//                            }) {
//                                VStack() {
//                                    Image(systemName: self.food == true ? "gamecontroller.fill" : "gamecontroller")
//                                        .font(.systemMedium(size: 25))
//                                        .imageScale(.medium)
//                                        .foregroundColor(self.food == true ? Color ("turquoise-2") : Color ("almost_black"))
//                                        .frame(width: 25, height: 25)
//
//                                    Text("Food")
//                                        .font(.systemBold(size: 12))
//                                        .foregroundColor(self.food == true ? Color ("turquoise-2") : Color ("almost_black"))
//                                }
//                            }
//
//                            //                        Circle()
//                            //                            .overlay(
//                            Button(action: {
//                                withAnimation(.linear(duration: 0.1)) {
//                                    //                                self.changePage()
//                                    self.entertain.toggle()
//                                }
//                            }) {
//                                VStack() {
//                                    Image(systemName: self.entertain == true ? "guitars.fill" : "guitars")
//                                        .font(.systemMedium(size: 24))
//                                        .imageScale(.medium)
//                                        .foregroundColor(self.entertain == true ? Color ("turquoise-1") : Color ("almost_black"))
//                                        .frame(width: 25, height: 25)
//                                        .offset(x: -1)
//                                        .padding(.horizontal)
//
//                                    Text("Fun")
//                                        .font(.systemBold(size: 12))
//                                        .foregroundColor(self.entertain == true ? Color ("turquoise-1") : Color ("almost_black"))
//                                }
//                            }
//
//
//                            Button(action: {
//                                withAnimation(.linear(duration: 0.1)) {
//                                    //                                self.changePage()
//                                    self.sport.toggle()
//                                }
//                            }) {
//                                VStack() {
//                                    Image(systemName: "bicycle")
//                                        .font(.systemMedium(size: 25))
//                                        .imageScale(.medium)
//                                        .foregroundColor(self.sport == true ? Color ("turquoise") : Color ("almost_black"))
//                                        .frame(width: 25, height: 25)
//
//                                    Text("Sport")
//                                        .font(.systemBold(size: 12))
//                                        .foregroundColor(self.sport == true ? Color ("turquoise") : Color ("almost_black"))
//                                }
//                            }
//                        }
//                    } else {
//                        HStack(alignment: .top){
//
//                            Button(action: {
//                                withAnimation(.linear(duration: 0.1)) {
//                                    //                                self.changePage()
//                                    self.food.toggle()
//                                }
//                            }) {
//                                Circle().fill(self.food == true ? Color ("turquoise-2") : buttonBackColor).frame(width: 40, height: 40)
//                                    .overlay(
//                                        VStack() {
//                                            Image(systemName: self.food == true ? "gamecontroller.fill" : "gamecontroller")
//                                                .font(.systemMedium(size: 22))
//                                                .imageScale(.medium)
//                                                .foregroundColor(self.food == true ? Color ("almost_black") : Color .black)
//                                                .frame(width: 25, height: 25)
//
//                                            Text("Food")
//                                                .font(.systemMedium(size: 8))
//                                                .foregroundColor(self.food == true ? Color ("almost_black") : Color .black)
//                                        }
//                                    )
//                            }
//                            Button(action: {
//                                withAnimation(.linear(duration: 0.1)) {
//                                    self.entertain.toggle()
//                                }
//                            }) {
//                                Circle().fill(self.entertain == true ? Color ("turquoise-1") : buttonBackColor).frame(width: 40, height: 40)
//                                    .overlay(
//                                        VStack() {
//                                            Image(systemName: self.entertain == true ? "guitars.fill" : "guitars")
//                                                .font(.systemMedium(size: 21))
//                                                .imageScale(.medium)
//                                                .foregroundColor(self.entertain == true ? Color ("almost_black") : Color .black)
//                                                .frame(width: 25, height: 25)
//                                                .offset(x: -1)
//
//                                            Text("Fun")
//                                                .font(.systemMedium(size: 8))
//                                                .foregroundColor(self.entertain == true ? Color ("almost_black") : Color .black)
//                                        }
//                                    )
//                            }
//
//
//                            Button(action: {
//                                withAnimation(.linear(duration: 0.1)) {
//                                    self.sport.toggle()
//                                }
//                            }) {
//
//                                Circle().fill(self.sport == true ? Color ("turquoise") : buttonBackColor).frame(width: 40, height: 40)
//                                    .overlay(
//                                        VStack() {
//                                            Image(systemName: "bicycle")
//                                                .font(.systemMedium(size: 22))
//                                                .imageScale(.medium)
//                                                .foregroundColor(self.sport == true ? Color ("almost_black") : Color .black)
//                                                .frame(width: 25, height: 25)
//
//                                            Text("Sport")
//                                                .font(.systemMedium(size: 8))
//                                                .foregroundColor(self.sport == true ? Color ("almost_black") : Color .black)
//                                        }
//                                    )
//                            }
//                        }
//                    }
                    
//                    HStack(alignment: .center) {
//
//                        Image(systemName: "location.fill")
//                            .font(.systemSemibold(size: 13))
//                            .imageScale(.medium)
//                            .foreground(Color ("lavender"))
//                            .frame(width: 12, height: 19)
//
//                        Text("Los Angeles")
//                            .font(.systemBold(size: 13))
//                            .foregroundColor(foreColor)
//                            .lineLimit(1)
//                    }
//                    .padding(.top, 19)
//
//                    HStack(alignment: .center) {
//                        Text("5 Kilometer Umkreis")
//                            .font(.systemBold(size: 13))
//                            .foregroundColor(foreColor)
//                            .lineLimit(1)
//                    }
                    
                    
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
