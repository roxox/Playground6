//
//  SearchMenu.swift
//  Playground6
//
//  Created by Sebastian Fox on 25.10.20.
//

import SwiftUI

struct MenuSearch: View {
    @EnvironmentObject var menuControl: MenuControl
    @State private var scrollViewID = UUID()
    @State private var showCategories = false
    @Binding var isSearchActive: Bool
    
    func closeMenu() {
        
        for family in UIFont.familyNames {

            let sName: String = family as String
            print("family: \(sName)")

            for name in UIFont.fontNames(forFamilyName: sName) {
                print("name: \(name as String)")
            }
        }
        
        self.menuControl.showSearchMenu.toggle()
        scrollViewID = UUID()
    }
    
    var body: some View {
        VStack() {
            Spacer()
            VStack() {
                ZStack(alignment: .center){
                    HStack() {
                        Spacer()
                        Button(action: {
                            self.closeMenu()
                        }) {
//                            ZStack() {
//                                Circle()
//                                    .foregroundColor(Color .black)
//                                    .frame(width: 23, height: 23)
//                                Image(systemName: "xmark.circle.fill")
//                                    .font(.system(size: 24))
//                                    .imageScale(.medium)
//                                    .foregroundColor(Color ("bright_gray"))
//                                    .frame(width: 24, height: 24)
                                
//                                RoundedRectangle(cornerRadius: 12)
//                                    .frame(height: 24)
//                                    .overlay(
                                
                                HStack() {
                                    Text("fertig")
                                        .font(.systemSemibold(size: 18))
                                        .foregroundColor(Color .black)
                                        .padding(7)
                                        .padding(.horizontal, 4)
                                }
                                .background(Color ("bright_gray"))
                                .frame(height: 24)
                                .cornerRadius(12)
                                
//                                        .clipShape(RoundedRectangle(cornerRadius: 12)
//                                                    .frame(height: 24))
//                                    )
//                            }
                        }
                    }.padding(.horizontal, 16)
                    HStack() {
                        Text("Sucheinstellungen")
                            .font(.systemSemibold(size: 18))
//                            .fontWeight(.semibold)
                        Spacer()
                    }.padding(.leading, 16)
                }
                .padding(.top, 10)
                .padding(.top, 9)
                
                Group() {
                    
                    NavigationLink(destination: SubMenuLocation()) {
                    HStack(){
                        Image(systemName: "globe")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.black)
                            //                            .foreground(gradientPinkPurple)
                            .frame(width: 40, height: 22)
                            
                        
                        ZStack(){
                            HStack() {
//                                VStack(alignment: .leading) {
                                HStack(alignment: .bottom) {
                                    Text("Ort + Umkreis")
                                        .font(.systemMedium(size: 18))
                                        .foregroundColor(.black)
//                                        .fontWeight(.medium)
//                                        .offset(y: -1)
                                    
                                    //                                        Text("Los Angeles, \(getRandomDistance()) • von ")
                                    //                                            .font(.system(size: 14))
                                    //                                            .foregroundColor(Color ("gray-1"))
                                    Spacer()
                                    
//                                    Text("Las Vegas, Nevada +25km")
//                                        .font(.system(size: 14))
////                                        .fontWeight(.light)
//                                        .foregroundColor(Color ("gray-1"))
//                                        .offset(y: 1)
                                }
//                                Spacer()
                            }
                            Rectangle()
                                .frame(height: 0.5)
                                .foregroundColor(Color ("bright_gray"))
                                .offset(y: 32)
                        }
                    }.padding(.horizontal, 16)
                    .padding(.vertical, 4)
                    .padding(.bottom, 5)
                    .padding(.top, 10)
                    }
                    
                    NavigationLink(destination: SubMenuCategory()) {
                    HStack(){
                        //                        Image(systemName: "gamecontroller.fill")
                        Image(systemName: "gamecontroller.fill")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.black)
                            //                            .foreground(gradientRoyalblueViolet_2)
                            .frame(width: 40, height: 40)
                        
                        ZStack(){
                            HStack() {
//                                Button(action: {
//                                    withAnimation(.linear(duration: 0.2)) {
//                                        self.showCategories.toggle()
//                                    }
//                                }) {
//                                    VStack(alignment: .leading) {
                                    HStack(alignment: .bottom) {
                                        Text("Kategorie")
                                            .font(.systemMedium(size: 18))
                                            .foregroundColor(.black)
//                                            .fontWeight(.medium)
//                                            .offset(y: -1)
                                        Spacer()
//                                        Text("Essen & Trinken, Entertainment ...")
//                                            .font(.system(size: 14))
//    //                                        .fontWeight(.light)
//                                            .foregroundColor(Color ("gray-1"))
//                                            .lineLimit(1)
//                                            .offset(y: 1)
                                        
                                    }
                                    .background(Color.white)
//                                }
//                                Spacer()
                            }
                            Rectangle()
                                .frame(height: 0.5)
                                .foregroundColor(Color ("bright_gray"))
                                .offset(y: 32)
                        }
                    }.padding(.horizontal, 16)
                    .padding(.vertical, 4)
                    .padding(.top, 5)
                    }
                }
                
                Group() {
//                    HStack(){
//                        Text("OPTIONAL")
//                            //                            .font(.system(size: 13))
//                            .font(.system(size: 13))
//                            .fontWeight(.medium)
//                            .foregroundColor(Color ("gray"))
//                        Spacer()
//                    }.padding(.horizontal, 16)
//                    .padding(.top, 13)
//                    .padding(.bottom, 5)
                    
                    NavigationLink(destination: SubMenuCategory()) {
                        HStack(){
                            Image(systemName: "star.fill")
                                .font(.system(size: 20, weight: .bold))
                                .imageScale(.medium)
                                .foregroundColor(.black)
                                .frame(width: 40, height: 40)
                            
                            //                            ZStack(){
                            HStack(alignment: .bottom) {
//                                VStack(alignment: .leading) {
                                    HStack() {
                                    Text("Interessen")
                                        .font(.systemMedium(size: 18))
                                        .foregroundColor(.black)
//                                        .fontWeight(.medium)
//                                        .offset(y: -1)
                                    Spacer()
//                                    Text("0")
//                                        .font(.system(size: 14))
////                                        .fontWeight(.light)
//                                        .foregroundColor(Color ("gray-1"))
////                                        .offset(y: 1)
                                }
//                                Spacer()
                                
                            }
                            
                        }.padding(.horizontal, 16)
                        .padding(.vertical, 4)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    }
                }
                
                Group() {
                    //                    Divider().padding(.horizontal, 16)
                    HStack() {
                        
                        //                        Spacer()
                        
                        if isSearchActive {
                            
                            VStack() {
                                
                                HStack(){
                                    Text("Du kannst deine Suche pausieren bzw. deaktivieren, in der Zeit wirst du auch nicht von anderen gefunden.")
//            DU KANNST DEINE SUCHE PAUSIEREN/DEAKTIVIEREN, IN DER ZEIT WIRST DU AUCH NICHT VON ANDEREN GEFUNDEN.
                                        //                            .font(.system(size: 13))
                                        .font(.systemMedium(size: 13))
//                                        .fontWeight(.medium)
                                        .foregroundColor(Color ("gray"))
                                    Spacer()
                                }.padding(.horizontal, 16)
                                .padding(.top, 5)
                                .padding(.bottom, 5)
                                
                                Button(action: {
                                    withAnimation(.linear(duration: 0.2)) {
                                        isSearchActive.toggle()
                                        menuControl.showSearchMenu = false
                                    }
                                }) {
                                    
                                    HStack(){
                                        
                                        Image(systemName: "moon.zzz.fill")
                                            .font(.system(size: 20, weight: .bold))
                                            .imageScale(.medium)
                                            .foregroundColor(.black)
                                            .frame(width: 40, height: 40)
                                        
                                        Text("Pausieren")
                                            .font(.systemMedium(size: 18))
                                            .foregroundColor(.black)
//                                                    .fontWeight(.medium)
                                        Spacer()
                                    }
                                }
                                .padding(.leading, 16)
                                
                                //                                    .padding(.bottom, 25)
                                
                                //                                Divider().padding(.horizontal, 16)
                                
                                NavigationLink(destination: SubMenuCategory()) {
                                    HStack(){
                                        Image(systemName: "checkmark")
                                            .font(.system(size: 20, weight: .bold))
                                            .imageScale(.medium)
                                            .foregroundColor(.black)
                                            .frame(width: 40, height: 40)
                                        
                                        HStack() {
                                            VStack(alignment: .leading) {
                                                Text("Änderungen übernehmen")
                                                    .font(.systemMedium(size: 18))
                                                    .foregroundColor(.black)
//                                                    .fontWeight(.medium)
//                                                    .offset(y: -1)
                                                
                                                //                                                Text("Nichts ausgewählt")
                                                //                                                    .font(.system(size: 14))
                                                //            //                                        .fontWeight(.light)
                                                //                                                    .foregroundColor(Color ("gray-1"))
                                                //                                                    .offset(y: 1)
                                            }
                                            Spacer()
                                            
                                        }
                                    }.padding(.horizontal, 16)
                                    .padding(.vertical, 4)
                                    .padding(.top, 5)
                                    .padding(.bottom, 15)
                                }
                                
                            }
                        } else {
                            
                            Button(action: {
                                withAnimation(.linear(duration: 0.2)) {
                                    isSearchActive.toggle()
                                    menuControl.showSearchMenu = false
                                }
                            }) {
                                HStack(){
                                    Text("Los geht's!")
                                        .font(.system(size: 18, weight: .medium))
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(.leading, 16)
                            .padding(.bottom, 25)
                            
                        }
                        Spacer()
                    }
                }
                
            }.background(Color .white)
            .cornerRadius(15)
        }
    }
}

//struct CategoryMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryMenu()
//    }
//}
