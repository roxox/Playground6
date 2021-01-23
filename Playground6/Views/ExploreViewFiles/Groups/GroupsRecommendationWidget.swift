//
//  GroupsRecommendationView.swift
//  Playground6
//
//  Created by Sebastian Fox on 22.01.21.
//

import SwiftUI

struct GroupsRecommendationWidget: View {
    var body: some View {
        VStack() {
            
            appGroupData[5].image
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: deviceWidth, height: 320)
                .overlay(
                    ZStack() {
                        centerGradientInverted
                        
                        VStack() {
                            HStack {
                                Text("Vorschläge für neue Gruppen")
                                    .font(.systemExtrabold(size: 14))
                                    .foregroundColor(Color.white)
                                    .lineLimit(1)
                                Spacer()
                                
                                Image(systemName: "repeat")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .frame(width: 20, height: 10)
                                
                            }
                            .padding(.bottom, 5)
                            
                            HStack {
                                Text("Burger bei In'N'Out")
                                    .font(.systemBold(size: 28))
                                    .foregroundColor(Color.white)
                                    .lineLimit(1)
                                
                                Spacer()
                            }
                            HStack {
                                Text("Lake Forest")
                                    .font(.systemMedium(size: 18))
                                    .foregroundColor(Color.white)
                                    .lineLimit(1)
                                
                                Spacer()
                            }
                            Spacer()
                            
                            HStack() {
                                Spacer()
                                HStack() {
                                    Text("Anpassen und erstellen")
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

struct GroupsRecommendationWidget_Previews: PreviewProvider {
    static var previews: some View {
        GroupsRecommendationWidget()
    }
}
