//
//  GroupsRecommendationView.swift
//  Playground6
//
//  Created by Sebastian Fox on 22.01.21.
//

import SwiftUI

struct GroupsGroupsWidget: View {
    
    @State var group: AppUserGroup = appGroupData[4]
    @State var location: String = "Laguna Beach"
    
    func changeGroup() {
        if group == appGroupData[4] {
            group = appGroupData[5]
            location = "Los Angeles"
        } else {
            group = appGroupData[4]
            location = "Laguna Beach"
        }
    }
    
    var body: some View {
        VStack() {
            
            group.image
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: deviceWidth, height: 320)
//                .overlay(
//                    VisualEffectView(effect: UIBlurEffect(style: .dark))
//                        .cornerRadius(15)
//                )
                .overlay(
                    ZStack() {
                        centerGradientInverted
                        
                        VStack() {
                            HStack {
                                Text("In der Nähe")
                                    .font(.systemExtrabold(size: 14))
                                    .foregroundColor(Color.white)
                                    .lineLimit(1)
                                Spacer()
                                
//                                Image(systemName: "repeat")
//                                    .font(.system(size: 20))
//                                    .foregroundColor(.white)
//                                    .frame(width: 20, height: 20)
                                
                            }
                            .padding(.bottom, 2)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(group.title!)
                                    .font(.systemBold(size: 28))
                                    .foregroundColor(Color.white)
                                    .lineLimit(1)
                                    
                                    Text(location)
                                        .font(.systemMedium(size: 18))
                                        .foregroundColor(Color.white)
                                        .lineLimit(1)
                                }
                                Spacer()
                                }
//                            .padding(.horizontal, 25)
//                            .padding(.top, 25)
                            
                        Spacer()
                            
//                            HStack() {
//                            Image(systemName: "chevron.compact.left")
//                                .font(.system(size: 30))
//                                .imageScale(.medium)
//                                .foregroundColor(.white)
//                                .frame(width: 30, height: 30)
//
//                                Spacer()
//
//                                Image(systemName: "chevron.compact.right")
//                                    .font(.system(size: 30))
//                                    .imageScale(.medium)
//                                    .foregroundColor(.white)
//                                    .frame(width: 30, height: 30)
//                            }
                            
                        Spacer()
                            
                            HStack() {
                                
                                
                                Button(action: {
                                    withAnimation(.linear(duration: 0.2)) {
                                        //                                self.changePage()
//                                        self.toggleColor()
                                        self.changeGroup()
                                    }
                                }) {
                                HStack() {
                                    Text("Alle 13 Gruppen anzeigen")
                                        .font(.systemBold(size: 16))
                //                        .underline()
                                        .foregroundColor(.white)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 10)
                                }
                                .background(Color.black.opacity(0.4))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color .white, lineWidth: 1))
                            }
                                
                                Spacer()
                            }
//                            .padding(.horizontal, 15)
                            
//                            HStack() {
//
//
//                                Text("13 Gruppen in der Nähe")
//                                    .font(.systemMedium(size: 16))
//                                    .foregroundColor(Color.white)
//                                    .lineLimit(1)
//
//                                Spacer()
//                            }
//                            .padding(.horizontal, 15)
                            
//                            .padding(.bottom, 25)
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                        .padding(.bottom, 25)
                    }
                )
                .cornerRadius(25)
        }
    }
}
