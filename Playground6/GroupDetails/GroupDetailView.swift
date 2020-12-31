//
//  GroupDetailView.swift
//  Playground6
//
//  Created by Sebastian Fox on 28.10.20.
//

import SwiftUI

struct GroupDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var group: AppUserGroup!
    
    let itemWidthGroup: CGFloat = deviceWidth - 32 //384 //167*2+20+30
    let headerWidthGroup: CGFloat = deviceWidth //384 //167*2+20+30
    let itemHeightGroup: CGFloat = 233 // 1,648 Ratio
    let headerHeightGroup: CGFloat = 260 // 1,648 Ratio
    
    func getRandomUser() -> AppUser {
        let randomInt = Int.random(in: 0..<appUserData.count)
        return appUserData[randomInt]
    }
    
    var body: some View {
        //        HStack() {
        //        if group != nil {
        //            Text(group.title!)
        //        } else {
        //            Text("Empty Group found")
        //        }
        //        }.onAppear {
        //            print("ContentView appeared!")
        //        }
        ZStack() {
//            Text("hallo")
            
        ScrollView(){
            VStack(){
                Group() {
                    ZStack() {
                        self.group.image
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .frame(width: headerWidthGroup)
                            //                            .frame(width: 414)
                            .cornerRadius(0)
                            
                            .overlay(
                                ZStack() {
                                    gradient
                                    
                                    VStack(alignment: .center) {
                                        Spacer()
                                        
                                        HStack() {
                                            //                                                                        Spacer()
                                            Text("Los Angeles")
                                                .font(.systemSemibold(size: 17))
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        .offset(y: 12)
                                        .padding(.leading, 10)
                                        
                                        HStack() {
                                            //                                                                        Spacer()
                                            Text(group.title!)
                                                .font(.systemBold(size: 28))
                                                .lineLimit(1)
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        .offset(y: 15)
                                        .padding(.leading, 10)
                                        
                                        HStack() {
                                            
                                            group.returnUserFromId()!.image
                                                .renderingMode(.original)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 30, height: 30)
                                                .clipShape(Circle())
                                            
                                            Text(group.returnUserFromId()!.username)
                                                .font(.systemMedium(size: 15))
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                        }
                                        .padding(.leading, 10)
                                        .padding(.bottom, 18)
                                    }
                                }
                                .cornerRadius(25)
                            )
                            .padding(.bottom, 10)
                    }
                }
                .padding(.bottom, 20)
                
                Group() {
//                    HStack(){
//                        Image(systemName: "doc.plaintext")
//                            .font(.system(size: 20, weight: .bold))
//                            .imageScale(.medium)
//                            .foregroundColor(.black)
//                            .frame(width: 40, height: 20)
//
//                        ZStack(){
//                            HStack() {
//                                Text("Beschreibung")
//                                    .font(.systemMedium(size: 18))
//                                    .foregroundColor(.black)
//                                Spacer()
//
//                            }
//                        }
//                    }.padding(.horizontal, 16)
                    
                    HStack(){
                        Text("Beschreibung")
                            .font(.systemSemibold(size: 17))
//                            .font(.systemMedium(size: 20))
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 15)
                    
                    HStack(alignment: .top){
                        Image(systemName: "doc.plaintext")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 20)
                        
                        ZStack(){
                            HStack() {
                                Text(group.description!)
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                        }
                    }.padding(.horizontal, 16)
                    .padding(.bottom, 15)
                }
                
//                HStack(){
//                    Image(systemName: "calendar.badge.clock")
//                        .font(.system(size: 20, weight: .bold))
//                        .imageScale(.medium)
//                        .foregroundColor(.black)
//                        .frame(width: 40, height: 20)
//
//                    ZStack(){
//                        HStack() {
//                            Text("Wann")
//                                .font(.systemMedium(size: 18))
//                                .foregroundColor(.black)
//                            Spacer()
//
//                        }
//                    }
//                }.padding(.horizontal, 16)
                
                
                
                HStack(){
                    Text("Zeit und Ort")
//                        .font(.systemMedium(size: 20))
                        .font(.systemSemibold(size: 17))
                        .lineLimit(1)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 15)
                
                HStack(){
                    Image(systemName: "calendar.badge.clock")
                        .font(.system(size: 20, weight: .bold))
                        .imageScale(.medium)
                        .foregroundColor(.black)
                        .frame(width: 40, height: 20)
                    
                    ZStack(){
                        HStack() {
                            Text("Heute")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            
                        }
                    }
                }.padding(.horizontal, 16)
                .padding(.bottom, 15)
                
                Group() {
//                    HStack(){
//                        Image(systemName: "globe")
//                            .font(.system(size: 20, weight: .bold))
//                            .imageScale(.medium)
//                            .foregroundColor(.black)
//                            .frame(width: 40, height: 20)
//
//                        ZStack(){
//                            HStack() {
//                                Text("Wo")
//                                    .font(.systemMedium(size: 18))
//                                    .foregroundColor(.black)
//                                Spacer()
//
//                            }
//                        }
//                    }.padding(.horizontal, 16)
                    
                    HStack(){
                        Image(systemName: "globe")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 20)
                        
                        ZStack(){
                            HStack() {
                                Text("Los Angeles")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                        }
                    }.padding(.horizontal, 16)
                    .padding(.bottom, 25)
                    
                    
                    HStack(alignment: .bottom){
                        Text("Treffpunkt")
//                            .font(.systemMedium(size: 20))
                            .font(.systemSemibold(size: 17))
                            .lineLimit(1)
                        Spacer()
                        
                        Text("Nur für Gruppenmitgleider")
                            .font(.systemMedium(size: 12))
                            .lineLimit(1)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 15)
                    
//                    HStack(){
//                        Image(systemName: "mappin.and.ellipse")
//                            .font(.system(size: 20, weight: .bold))
//                            .imageScale(.medium)
//                            .foregroundColor(.black)
//                            .frame(width: 40, height: 20)
//
//                        ZStack(){
//                            HStack() {
//                                Text("Treffpunkt")
//                                    .font(.systemMedium(size: 18))
//                                    .foregroundColor(.black)
//                                Spacer()
//
//                            }
//                        }
//                    }.padding(.horizontal, 16)
                    
                    HStack(){
                        Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 20)
                        
                        ZStack(){
                            HStack() {
                                Text("Parkplatz Greek Theatre")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                        }
                    }.padding(.horizontal, 16)
                    .padding(.bottom, 15)
                    
//                    HStack(){
//                        Image(systemName: "clock")
//                            .font(.system(size: 20, weight: .bold))
//                            .imageScale(.medium)
//                            .foregroundColor(.black)
//                            .frame(width: 40, height: 20)
//
//                        ZStack(){
//                            HStack() {
//                                Text("Zeitpunkt")
//                                    .font(.systemMedium(size: 18))
//                                    .foregroundColor(.black)
//                                Spacer()
//
//                            }
//                        }
//                    }.padding(.horizontal, 16)
                    
                    HStack(){
                        Image(systemName: "clock")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 20)
                        
                        ZStack(){
                            HStack() {
                                Text("8pm")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                        }
                    }.padding(.horizontal, 16)
                    .padding(.bottom, 15)
                    
                    
                    MapView(coordinate: appUserData[1].searchParameter.locationCoordinate)
                        .edgesIgnoringSafeArea(.top)
                        .frame(width: itemWidthGroup, height: itemHeightGroup)
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                }
                
                Group() {
                    HStack(){
                        Image(systemName: "person.2.fill")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 20)
                        
                        ZStack(){
                            HStack() {
                                Text("Bestätigte Mitglieder")
                                    .font(.systemMedium(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                        }
                    }.padding(.horizontal, 16)
                    .padding(.bottom, 15)
                    
                    VStack() {
                        ForEach(appUserData[0...4], id: \.self) { user in
                            HStack() {
                                user.image
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                
                                Text(user.username)
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                                
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 20, weight: .bold))
                                    .imageScale(.medium)
                                    .foregroundColor(.gray)
                                    .frame(width: 40, height: 20)
                            }
                        }
                    }.padding(.horizontal, 25)
//                    .padding(.bottom, 10)
                    
                    //                    Rectangle()
                    //                        .frame(height: 0.7)
                    //                        .foregroundColor(Color ("bright_gray"))
                    //                        .padding(.bottom, 20)
                    //                        .padding(.horizontal, 16)
                    //                        .padding(.leading, 40)
                    .padding(.bottom, 35)
                    
                    HStack(){
                        Image(systemName: "person")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 20)
                        
                        ZStack(){
                            HStack() {
                                Text("Offene Anfragen")
                                    .font(.systemMedium(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                        }
                    }.padding(.horizontal, 16)
                    
                    VStack() {
                        ForEach(appUserData[5...7], id: \.self) { user in
                            HStack() {
                                user.image
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                
                                Text(user.username)
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                                
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 20, weight: .bold))
                                    .imageScale(.medium)
                                    .foregroundColor(.gray)
                                    .frame(width: 40, height: 20)
                                
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 20, weight: .bold))
                                    .imageScale(.medium)
                                    .foregroundColor(.gray)
                                    .frame(width: 40, height: 20)
                                
                            }
                        }
                    }.padding(.horizontal, 25)
                    
                    //                    HStack(){
                    //                        Image(systemName: "person")
                    //                            .font(.system(size: 20, weight: .bold))
                    //                            .imageScale(.medium)
                    //                            .foregroundColor(.clear)
                    //                            .frame(width: 40, height: 0)
                    //
                    //                        ZStack(){
                    //                            HStack() {
                    //                                Text("Keine weiteren Anfragen")
                    //                                    .font(.system(size: 18))
                    //                                    .foregroundColor(.black)
                    //                                Spacer()
                    //
                    //                            }
                    //                        }
                    //                    }.padding(.horizontal, 16)
                    
                    //                    Rectangle()
                    //                        .frame(height: 0.7)
                    //                        .foregroundColor(Color ("bright_gray"))
                    //                        .padding(.bottom, 20)
                    //                        .padding(.horizontal, 16)
                    //                        .padding(.leading, 40)
                    .padding(.bottom, 15)
                }
                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }
            
            VStack() {
                Rectangle().fill(Color .clear).frame(height: 7)
            HStack(alignment: .top) {
                
                Button(action: {
                    withAnimation(.linear(duration: 0.1)) {
                        //                                self.changePage()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    VStack(alignment: .leading) {
                        Rectangle().fill(Color .clear).frame(height: 30)
                        
                        Image(systemName: "xmark")
                            .font(.system(size: 28))
                            .imageScale(.medium)
                            .foregroundColor(Color .white)
                            .frame(width: 30, height: 30)
                            .shadow(radius: 0.2)
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 27)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

//struct GroupDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupDetailView()
//    }
//}
