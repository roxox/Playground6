//
//  GroupList.swift
//  Playground6
//
//  Created by Sebastian Fox on 23.10.20.
//

import SwiftUI

struct GroupList: View {
    @Binding var groups: [AppUserGroup]
    @Binding var design: Design
    
    func changeDesign() {
        if design == .list {
            design = .tile
        } else if design == .tile {
            design = .tile4
        } else if design == .tile4 {
            design = .list
        }
    }
    
    var body: some View {
        ScrollView() {
            LazyVStack() {
                
                    if design == .list {
                                HStack(){
                                    Text("Gruppen")
                                        .font(.systemBold(size: 15))
                                        .foreground(gradientCherryPeach)
                                    Spacer()
                                }.padding(.horizontal, 16)
                                .padding(.top, 10)
                    }
                
                // Liste
                ForEach(groups, id: \.id) { appGroup in
                    if design == .list {
                        GroupListRowItem(appGroup: appGroup)
                    } else {
                        GroupTailItem(appGroup: appGroup)
                            .shadow(radius: 1, y: 1)
                            .padding(.bottom, 10)
                    }
                }
                
                
                Button(action: {
                    self.changeDesign()
                }) {
                    HStack() {
                        
                        Image(systemName: design == .list ? "rectangle.grid.1x2.fill" : "list.bullet")
                        .font(.system(size: 26))
                        .imageScale(.medium)
                        .foregroundColor(.black)
                        .frame(width: 26, height: 26)
                        
                    Text("Change Design")
                        .font(.systemSemibold(size: 16))
                        .foregroundColor(Color ("almost_black"))
                    }
                }
                    
                Rectangle().fill(Color .white).frame(height: 50)
                }
            .padding(.top, 6)
            }
        }
    }
