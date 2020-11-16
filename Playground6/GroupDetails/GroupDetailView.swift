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
    
    let itemWidthGroup: CGFloat = 384 //384 //167*2+20+30
    let headerWidthGroup: CGFloat = 414 //384 //167*2+20+30
    let itemHeightGroup: CGFloat = 233 // 1,648 Ratio
    let headerHeightGroup: CGFloat = 260 // 1,648 Ratio
    
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
        ScrollView(){
            VStack(){
                Group() {
                    ZStack() {
                        self.group.image
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .frame(width: headerWidthGroup, height: headerHeightGroup)
//                            .frame(width: 414)
                            .cornerRadius(0)
                            .padding(.bottom, 10)
                        
                        VStack() {
                            HStack(alignment: .top) {
                                
                                Button(action: {
                                    withAnimation(.linear(duration: 0.1)) {
                                        //                                self.changePage()
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                }) {
                                    ZStack() {
                                        Circle()
                                            .fill(Color .black.opacity(0.4))
                                            .frame(width: 27, height: 27)
                                        
                                    Image(systemName: "chevron.left.circle.fill")
                                        .font(.system(size: 28))
                                        .imageScale(.medium)
                                        .foregroundColor(Color .white)
                                        .frame(width: 30, height: 30)
                                        .shadow(radius: 2, y: 1)
                                    }
                                }
                                Spacer()
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 27)
                        .padding(.vertical, 15)
                    }
//                    HStack(){
//                        ZStack(){
//                            HStack() {
//
//                                appUserData[0].image
//                                    .renderingMode(.original)
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 50, height: 50)
//                                    .clipShape(Circle())
//                                
//                                Text("Sebastian")
//                                    .font(.systemMedium(size: 18))
//                                    .foregroundColor(.black)
//
//                                Spacer()
//                            }
//                        }
//                    }.padding(.horizontal, 16)
                    
                    HStack(){
                        Text(group.title!)
                            .font(.systemSemibold(size: 28))
                            .lineLimit(1)
                        //                                .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.bottom, 20)
                
                
                
                Group() {
                    HStack(){
                        Image(systemName: "doc.plaintext")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 20)
                        
                        ZStack(){
                            HStack() {
                                Text("Beschreibung")
                                    .font(.systemMedium(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                        }
                    }.padding(.horizontal, 16)
                    
                    HStack(){
                        Image(systemName: "doc.plaintext")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.clear)
                            .frame(width: 40, height: 0)
                        
                        ZStack(){
                            HStack() {
                                Text(group.description!)
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                        }
                    }.padding(.horizontal, 16)
                    
//                    Rectangle()
//                        .frame(height: 0.7)
//                        .foregroundColor(Color ("bright_gray"))
//                        .padding(.bottom, 20)
//                        .padding(.horizontal, 16)
//                        .padding(.leading, 40)
                        .padding(.bottom, 15)
                }
                
                HStack(){
                    Image(systemName: "calendar.badge.clock")
                        .font(.system(size: 20, weight: .bold))
                        .imageScale(.medium)
                        .foregroundColor(.black)
                        .frame(width: 40, height: 20)
                    
                    ZStack(){
                        HStack() {
                            Text("Wann")
                                .font(.systemMedium(size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            
                        }
                    }
                }.padding(.horizontal, 16)
                
                HStack(){
                    Image(systemName: "calendar.badge.clock")
                        .font(.system(size: 20, weight: .bold))
                        .imageScale(.medium)
                        .foregroundColor(.clear)
                        .frame(width: 40, height: 0)
                    
                    ZStack(){
                        HStack() {
                            Text("Heute")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            
                        }
                    }
                }.padding(.horizontal, 16)
                
//                Rectangle()
//                    .frame(height: 0.7)
//                    .foregroundColor(Color ("bright_gray"))
//                    .padding(.bottom, 20)
//                    .padding(.horizontal, 16)
//                    .padding(.leading, 40)
                .padding(.bottom, 15)
                
                Group() {
                HStack(){
                    Image(systemName: "globe")
                        .font(.system(size: 20, weight: .bold))
                        .imageScale(.medium)
                        .foregroundColor(.black)
                        .frame(width: 40, height: 20)
                    
                    ZStack(){
                        HStack() {
                            Text("Wo")
                                .font(.systemMedium(size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            
                        }
                    }
                }.padding(.horizontal, 16)
                
                HStack(){
                    Image(systemName: "globe")
                        .font(.system(size: 20, weight: .bold))
                        .imageScale(.medium)
                        .foregroundColor(.clear)
                        .frame(width: 40, height: 0)
                    
                    ZStack(){
                        HStack() {
                            Text("Los Angeles")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            
                        }
                    }
                }.padding(.horizontal, 16)
                    
//                    Rectangle()
//                        .frame(height: 0.7)
//                        .foregroundColor(Color ("bright_gray"))
//                        .padding(.horizontal, 16)
//                        .padding(.leading, 40)
//                        .padding(.bottom, 20)
                .padding(.bottom, 25)
                    
                    
                    HStack(){
                        Text("Nur für Gruppenmitgleider")
                            .font(.systemMedium(size: 20))
                            .lineLimit(1)
                        //                                .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 15)
                
                HStack(){
                    Image(systemName: "mappin.and.ellipse")
                        .font(.system(size: 20, weight: .bold))
                        .imageScale(.medium)
                        .foregroundColor(.black)
                        .frame(width: 40, height: 20)
                    
                    ZStack(){
                        HStack() {
                            Text("Treffpunkt")
                                .font(.systemMedium(size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            
                        }
                    }
                }.padding(.horizontal, 16)
                
                HStack(){
                    Image(systemName: "location.fill")
                        .font(.system(size: 20, weight: .bold))
                        .imageScale(.medium)
                        .foregroundColor(.clear)
                        .frame(width: 40, height: 0)
                    
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
                    
                    HStack(){
                        Image(systemName: "clock")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 20)
                        
                        ZStack(){
                            HStack() {
                                Text("Zeitpunkt")
                                    .font(.systemMedium(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                        }
                    }.padding(.horizontal, 16)
                    
                    HStack(){
                        Image(systemName: "clock")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.clear)
                            .frame(width: 40, height: 0)
                        
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
                    
//                    Rectangle()
//                        .frame(height: 0.7)
//                        .foregroundColor(Color ("bright_gray"))
//                        .padding(.bottom, 20)
//                        .padding(.horizontal, 16)
//                        .padding(.leading, 40)
                        .padding(.bottom, 15)
                    
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
                    
                    HStack(){
                        Image(systemName: "person")
                            .font(.system(size: 20, weight: .bold))
                            .imageScale(.medium)
                            .foregroundColor(.clear)
                            .frame(width: 40, height: 0)
                        
                        ZStack(){
                            HStack() {
                                Text("Keine weiteren Anfragen")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                        }
                    }.padding(.horizontal, 16)
                    
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
//        .edgesIgnoringSafeArea(.all)
    }
}

//struct GroupDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupDetailView()
//    }
//}
