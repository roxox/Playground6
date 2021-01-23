//
//  UsersView.swift
//  Playground6
//
//  Created by Sebastian Fox on 13.11.20.
//

import SwiftUI

struct UsersMainView: View {
    
    @Binding var users: [AppUser]
    @State var backColor: Color = Color.black
    @State var toggleOn: Bool = false
    @State var foreColor: Color = Color.white
    @State var buttonBackColor: Color = Color ("almost_black")
    @State var selectedUser: AppUser = appUserData[0]
    
    // FOR TESTING
    //    @State var entertain: Bool = false
    //    @State var food: Bool = false
    //    @State var sport: Bool = false
    //    @State var search: Bool = false
    //    @State var isCircle: Bool = true
    
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
    
    @Binding var entertain: Bool
    @Binding var food: Bool
    @Binding var sport: Bool
    @Binding var search: Bool
    @Binding var isCircle: Bool
    
    var body: some View {
        VStack() {
            Group() {
                //                HStack(alignment: .center) {
                //                    Text("Sieh dir an wer in der Nähe ist")
                //                        .font(.systemMedium(size: 24))
                //                        .foregroundColor(foreColor)
                //                        .lineLimit(1)
                //                }
                //                .padding(.top, 40)
                //                .padding(.bottom, 24)
                
                if isCircle != true {
                    HStack(alignment: .top){
                        
                        Button(action: {
                            withAnimation(.linear(duration: 0.1)) {
                                self.food.toggle()
                            }
                        }) {
                            VStack() {
                                Image(systemName: self.food == true ? "gamecontroller.fill" : "gamecontroller")
                                    .font(.systemMedium(size: 23))
                                    .imageScale(.medium)
                                    .foregroundColor(self.food == true ? Color ("turquoise-2") : Color ("almost_black"))
                                    .frame(width: 25, height: 25)
                                
                                Text("Food")
                                    .font(.systemMedium(size: 8))
                                    .foregroundColor(self.food == true ? Color ("turquoise-2") : Color ("almost_black"))
                            }
                        }
                        Button(action: {
                            withAnimation(.linear(duration: 0.1)) {
                                self.entertain.toggle()
                            }
                        }) {
                            VStack() {
                                Image(systemName: self.entertain == true ? "guitars.fill" : "guitars")
                                    .font(.systemMedium(size: 22))
                                    .imageScale(.medium)
                                    .foregroundColor(self.entertain == true ? Color ("turquoise-1") : Color ("almost_black"))
                                    .frame(width: 25, height: 25)
                                    .offset(x: -1)
                                    .padding(.horizontal)
                                
                                Text("Fun")
                                    .font(.systemMedium(size: 8))
                                    .foregroundColor(self.entertain == true ? Color ("turquoise-1") : Color ("almost_black"))
                            }
                        }
                        
                        Button(action: {
                            withAnimation(.linear(duration: 0.1)) {
                                self.sport.toggle()
                            }
                        }) {
                            VStack() {
                                Image(systemName: "bicycle")
                                    .font(.systemMedium(size: 23))
                                    .imageScale(.medium)
                                    .foregroundColor(self.sport == true ? Color ("turquoise") : Color ("almost_black"))
                                    .frame(width: 25, height: 25)
                                
                                Text("Sport")
                                    .font(.systemMedium(size: 8))
                                    .foregroundColor(self.sport == true ? Color ("turquoise") : Color ("almost_black"))
                            }
                        }
                        
                        VStack() {
                            HStack(alignment: .center) {
                                
                                Image(systemName: "location.fill")
                                    .font(.systemBold(size: 13))
                                    .imageScale(.medium)
                                    .foreground(Color ("lavender"))
                                    .frame(width: 12, height: 19)
                                
                                Text("Los Angeles")
                                    .font(.systemBold(size: 13))
                                    .foregroundColor(foreColor)
                                    .lineLimit(1)
                            }
//                            .padding(.top, 19)
                            HStack(alignment: .center) {
                                Text("5 Kilometer Umkreis")
                                    .font(.systemBold(size: 13))
                                    .foregroundColor(foreColor)
                                    .lineLimit(1)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 50)
                } else {
                    HStack(alignment: .top){
                        Button(action: {
                            withAnimation(.linear(duration: 0.1)) {
                                self.food.toggle()
                            }
                        }) {
                            Circle().fill(self.food == true ? Color ("turquoise-2") : buttonBackColor).frame(width: 40, height: 40)
                                .overlay(
                                    VStack() {
                                        Image(systemName: self.food == true ? "gamecontroller.fill" : "gamecontroller")
                                            .font(.systemMedium(size: 22))
                                            .imageScale(.medium)
                                            .foregroundColor(self.food == true ? Color ("almost_black") : Color .black)
                                            .frame(width: 25, height: 25)
                                        
                                        Text("Food")
                                            .font(.systemMedium(size: 8))
                                            .foregroundColor(self.food == true ? Color ("almost_black") : Color .black)
                                    }
                                )
                        }
                        Button(action: {
                            withAnimation(.linear(duration: 0.1)) {
                                self.entertain.toggle()
                            }
                        }) {
                            Circle().fill(self.entertain == true ? Color ("turquoise-1") : buttonBackColor).frame(width: 40, height: 40)
                                .overlay(
                                    VStack() {
                                        Image(systemName: self.entertain == true ? "guitars.fill" : "guitars")
                                            .font(.systemMedium(size: 21))
                                            .imageScale(.medium)
                                            .foregroundColor(self.entertain == true ? Color ("almost_black") : Color .black)
                                            .frame(width: 25, height: 25)
                                            .offset(x: -1)
                                        
                                        Text("Fun")
                                            .font(.systemMedium(size: 8))
                                            .foregroundColor(self.entertain == true ? Color ("almost_black") : Color .black)
                                    }
                                )
                        }
                        
                        Button(action: {
                            withAnimation(.linear(duration: 0.1)) {
                                self.sport.toggle()
                            }
                        }) {
                            
                            Circle().fill(self.sport == true ? Color ("turquoise") : buttonBackColor).frame(width: 40, height: 40)
                                .overlay(
                                    VStack() {
                                        Image(systemName: "bicycle")
                                            .font(.systemMedium(size: 22))
                                            .imageScale(.medium)
                                            .foregroundColor(self.sport == true ? Color ("almost_black") : Color .black)
                                            .frame(width: 25, height: 25)
                                        
                                        Text("Sport")
                                            .font(.systemMedium(size: 8))
                                            .foregroundColor(self.sport == true ? Color ("almost_black") : Color .black)
                                    }
                                )
                        }
                        
                        VStack() {
                            HStack(alignment: .center) {
                                
                                Image(systemName: "location.fill")
                                    .font(.systemBold(size: 13))
                                    .imageScale(.medium)
                                    .foreground(Color ("lavender"))
                                    .frame(width: 12, height: 19)
                                
                                Text("Los Angeles")
                                    .font(.systemBold(size: 13))
                                    .foregroundColor(foreColor)
                                    .lineLimit(1)
                            }
//                            .padding(.top, 19)
                            HStack(alignment: .center) {
                                Text("5 Kilometer Umkreis")
                                    .font(.systemBold(size: 13))
                                    .foregroundColor(foreColor)
                                    .lineLimit(1)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 50)
                }
                
//                VStack() {
//                    HStack(alignment: .center) {
//
//                        Image(systemName: "location.fill")
//                            .font(.systemBold(size: 13))
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
//                    HStack(alignment: .center) {
//                        Text("5 Kilometer Umkreis")
//                            .font(.systemBold(size: 13))
//                            .foregroundColor(foreColor)
//                            .lineLimit(1)
//                    }
//                }
                
//                HStack(alignment: .top){
//                    Button(action: {
//                        withAnimation(.linear(duration: 0.1)) {
//                            self.isCircle.toggle()
//                        }
//                    }) {
//                        HStack() {
//
//                            Image(systemName: "ellipsis")
//                                .font(.systemBold(size: 17))
//                                .imageScale(.medium)
//                                .foregroundColor(foreColor)
//                                .frame(width: 22, height: 22)
//                        }
//                    }
//                    Spacer()
//                }
//                .padding(.horizontal)
//                .padding(.bottom)
            }
            
            //                Group() {
            //                    HStack(alignment: .center) {
            //                        Text("Sieh dir an wer in der Nähe ist")
            //                            .font(.systemMedium(size: 24))
            //                            .foregroundColor(foreColor)
            //                            .lineLimit(1)
            //                    }
            //                    .padding(.top, 40)
            //                    .padding(.bottom, 24)
            //
            //                    if isCircle != true {
            //                        HStack(alignment: .top){
            //
            //                            Button(action: {
            //                                withAnimation(.linear(duration: 0.1)) {
            //                                    self.food.toggle()
            //                                }
            //                            }) {
            //                                VStack() {
            //                                    Image(systemName: self.food == true ? "gamecontroller.fill" : "gamecontroller")
            //                                        .font(.systemMedium(size: 23))
            //                                        .imageScale(.medium)
            //                                        .foregroundColor(self.food == true ? Color ("turquoise-2") : Color ("almost_black"))
            //                                        .frame(width: 25, height: 25)
            //
            //                                    Text("Food")
            //                                        .font(.systemMedium(size: 8))
            //                                        .foregroundColor(self.food == true ? Color ("turquoise-2") : Color ("almost_black"))
            //                                }
            //                            }
            //                            Button(action: {
            //                                withAnimation(.linear(duration: 0.1)) {
            //                                    self.entertain.toggle()
            //                                }
            //                            }) {
            //                                VStack() {
            //                                    Image(systemName: self.entertain == true ? "guitars.fill" : "guitars")
            //                                        .font(.systemMedium(size: 22))
            //                                        .imageScale(.medium)
            //                                        .foregroundColor(self.entertain == true ? Color ("turquoise-1") : Color ("almost_black"))
            //                                        .frame(width: 25, height: 25)
            //                                        .offset(x: -1)
            //                                        .padding(.horizontal)
            //
            //                                    Text("Fun")
            //                                        .font(.systemMedium(size: 8))
            //                                        .foregroundColor(self.entertain == true ? Color ("turquoise-1") : Color ("almost_black"))
            //                                }
            //                            }
            //
            //                            Button(action: {
            //                                withAnimation(.linear(duration: 0.1)) {
            //                                    self.sport.toggle()
            //                                }
            //                            }) {
            //                                VStack() {
            //                                    Image(systemName: "bicycle")
            //                                        .font(.systemMedium(size: 23))
            //                                        .imageScale(.medium)
            //                                        .foregroundColor(self.sport == true ? Color ("turquoise") : Color ("almost_black"))
            //                                        .frame(width: 25, height: 25)
            //
            //                                    Text("Sport")
            //                                        .font(.systemMedium(size: 8))
            //                                        .foregroundColor(self.sport == true ? Color ("turquoise") : Color ("almost_black"))
            //                                }
            //                            }
            //                        }
            //                    } else {
            //                        HStack(alignment: .top){
            //                            Button(action: {
            //                                withAnimation(.linear(duration: 0.1)) {
            //                                    self.food.toggle()
            //                                }
            //                            }) {
            //                                Circle().fill(self.food == true ? Color ("turquoise-2") : Color ("almost_black")).frame(width: 40, height: 40)
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
            //                                Circle().fill(self.entertain == true ? Color ("turquoise-1") : Color ("almost_black")).frame(width: 40, height: 40)
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
            //                            Button(action: {
            //                                withAnimation(.linear(duration: 0.1)) {
            //                                    self.sport.toggle()
            //                                }
            //                            }) {
            //
            //                                Circle().fill(self.sport == true ? Color ("turquoise") : Color ("almost_black")).frame(width: 40, height: 40)
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
            //
            //                    HStack(alignment: .center) {
            //
            //                        Image(systemName: "location.fill")
            //                            .font(.systemBold(size: 13))
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
            //                    HStack(alignment: .center) {
            //                        Text("5 Kilometer Umkreis")
            //                            .font(.systemBold(size: 13))
            //                            .foregroundColor(foreColor)
            //                            .lineLimit(1)
            //                    }
            //
            //                    HStack(alignment: .top){
            //                        Button(action: {
            //                            withAnimation(.linear(duration: 0.1)) {
            //                                self.isCircle.toggle()
            //                            }
            //                        }) {
            //                            HStack() {
            //
            //                                Image(systemName: "ellipsis")
            //                                    .font(.systemBold(size: 17))
            //                                    .imageScale(.medium)
            //                                    .foregroundColor(foreColor)
            //                                    .frame(width: 22, height: 22)
            //                            }
            //                        }
            //                        Spacer()
            //                    }
            //                    .padding(.horizontal)
            //                    .padding(.bottom)
            //                }
            
            ScrollView(showsIndicators: false) {
                VStack() {
                    UsersListView(users: $users)
                }
                .background(Color.white)
                .cornerRadius(20)
                
                Rectangle()
                    .fill(Color .clear)
                    .frame(height: 60)
                
                Button(action: {
                    withAnimation(.linear(duration: 0.1)) {
                        //                                self.changePage()
                        self.toggleColor()
                    }
                }) {
                    Text("Change Color")
                        .foregroundColor(.blue)
                }
                
                Rectangle()
                    .fill(Color .clear)
                    .frame(height: 100)
            }
            .padding(.top, 10)
        }
        .background(backColor)
    }
}
