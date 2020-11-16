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
                
                //                HStack() {
                //                    Text("Durchstobere auch Gruppen die zu dir passen konnten")
                //                        .font(.systemSemibold(size: 22))
                //                        .fontWeight(.medium)
                //                        .foregroundColor(Color.black)
                //    //                    .lineSpacing(2)
                //                        .lineLimit(2)
                //                        .padding(.horizontal, 26)
                //                    Spacer()
                //                }
                //                .padding(.top, 20)
                //                .padding(.bottom, 6)
                //
                //
                //                HStack() {
                //                    Text("Vielleicht hatte ja jemand die gleiche Idee wie du, durchsuche die Gegend nach Events, an denen du teilnehmen mochtet.")
                //                        .font(.system(size: 16))
                //                        .foregroundColor(Color.black)
                //                        .lineLimit(5)
                //                        .padding(.horizontal, 26)
                //                    Spacer()
                //                }
                //    //                        .padding(.top, 10)
                //                .padding(.bottom, 35)
                
                // Liste
                ForEach(groups, id: \.id) { appGroup in
                    if design == .list {
                        GroupListRowItem(appGroup: appGroup)
//                            .background(Color ("bright_gray"))
//                            .cornerRadius(10)
//                            .padding(.horizontal, 16)
                    } else {
                        GroupListRowItem_4(appGroup: appGroup)
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
//            .padding(.top, design == .list ? 4 : 24)
            .padding(.top, 6)
            }
//        .simultaneousGesture(
//                DragGesture()
//                    .onChanged { gesture in
////                        self.offset = gesture.translation
//                        print(gesture.location)
//                    }
//
//                    .onEnded { _ in
////                        print(gesture.tr)
////                        if abs(self.offset.width) > 100 {
////                            // remove the card
////                        } else {
////                            self.offset = .zero
////                        }
//                    }
//            )
        }
    }

//struct GroupList_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupList()
//    }
//}
