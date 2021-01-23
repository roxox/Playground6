//
//  UserComponentGroupDetails.swift
//  Playground6
//
//  Created by Sebastian Fox on 22.10.20.
//

import SwiftUI

var gradientVioletRoyalblue: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
                    //                    .pink,
                    //                    .red,
                    
                    .purple,
                    //                    Color ("violet"),
                    //                    Color ("violet"),
                    Color ("royal_blue")
                ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientRoyalblueViolet: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
                    Color ("royal_blue"),
                    .purple,
                    //                    .pink,
                    //                    Color ("violet"),
                    //                    Color ("violet"),
                ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientRoyalblueViolet_2: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
                    Color ("royal_blue"),
                    //                    .purple,
                    //                    Color ("cherry"),
                    //                                        .pink,
                    Color ("violet"),
                    //                    Color ("violet"),
                ]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
}

var gradientPinkRed: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
                    .pink,
                    Color ("cherry"),
                    //                    .red,
                    //                    .pink,
                ]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
}

var gradientPinkPurple: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
                    Color ("cherry"),
                    .pink,
                    //                    .red,
                    //                    Color ("violet"),
                    //                    .purple,
                ]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
}

var gradientTurquoiseBlue: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
                    Color ("turquoise"),
                    Color ("blue")
                ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientTRoyalBlueBlue: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
                [
                    Color ("violet"),
                    Color ("royal_blue"),
                    Color ("blue")
                ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

struct GroupDetails: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var menuControl: MenuControl
    @Binding var pageIndex: UserComponentPageIndex
    @Binding var selectedUsers: [AppUser]
    @Binding var showingDetail: Bool
    @Binding var groups: [AppUserGroup]
    
    @State private var showTitleTextField: Bool = false
    @State var titel: String = ""
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.4), Color.black.opacity(0.0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    func removeUserFromSelectedUsers(_ user: AppUser) {
        if selectedUsers.contains(user) {
            selectedUsers.remove(at: selectedUsers.firstIndex(of: user)!)
        }
    }
    
    func changePage() {
        if pageIndex == .listView {
            pageIndex = .detailsView
        } else {
            pageIndex = .listView
        }
        print(pageIndex)
    }
    
    func finish() {
        addGroup()
        selectedUsers.removeAll()
        self.showingDetail = false
    }
    
    func addGroup() {
        var newGroup: AppUserGroup = AppUserGroup()
        newGroup.title = titel
        newGroup.imageName = "sport4"
        newGroup.id = String(groups.count + 1)
        groups.append(newGroup)
    }
    
    func cancel() {
        selectedUsers.removeAll()
        self.showingDetail = false
    }
    
    var body: some View {
        NavigationView() {
            ZStack {
                VStack() {
                    
                    // Header Section
                    //                ZStack(){
                    //                    HStack() {
                    //                        Button(action: {
                    //                            withAnimation(.linear(duration: 0.1)) {
                    //                                //                                self.changePage()
                    //                                self.presentationMode.wrappedValue.dismiss()
                    //                            }
                    //                        }) {
                    //                            Text("Zurück")
                    //                                .font(.system(size: 17))
                    //                                .fontWeight(.medium)
                    //                                .foregroundColor(.gray)
                    //
                    //                        }
                    //                        Spacer()
                    //                        Button(action: {
                    //                            self.finish()
                    //                        }) {
                    //                            Text("Fertig")
                    //                                .font(.system(size: 17))
                    //                                .fontWeight(.medium)
                    //                                                                .foregroundColor(.black)
                    ////                                .foreground(gradientRoyalblueViolet)
                    //                        }
                    //                    }
                    //                    .padding(.horizontal, 16)
                    //
                    //                    HStack() {
                    //                        Spacer()
                    //                        Text("Gruppendetails")
                    //                            .font(.system(size: 18))
                    //                            .fontWeight(.semibold)
                    //                        Spacer()
                    //                    }
                    //                }
                    //                .padding(.bottom, 18)
                    //                .padding(.top, 15)
                    
                    
                    
                    // DetailView
                    ScrollView() {
                        LazyVStack() {
                            
//                            Rectangle().fill(Color ("violet"))
//                                .frame(height: 233)
//                                .frame(maxWidth: .infinity)
//                                .overlay(
//                                    VStack(alignment: .center) {
//                                        Spacer()
//                                        Text("Standardbild nach Kategorieauswahl")
//                                            .font(.systemSemibold(size: 18))
//                                            .foregroundColor(.white)
//                                            .padding(.horizontal, 30)
//                                            .padding(.bottom, 10)
//                                        
//                                        Text("oder")
//                                            .font(.system(size: 14))
//                                            .foregroundColor(.white)
//                                            .padding(.bottom, 10)
//                                        
//                                        HStack(){
//                                            
//                                            Image(systemName: "photo")
//                                                .font(.system(size: 16, weight: .bold))
//                                                .imageScale(.medium)
//                                                .foregroundColor(.white)
//                                                .frame(width: 28, height: 34)
//                                            
//                                            Text("Eigenes Foto auswählen")
//                                                .font(.systemMedium(size: 15))
//                                                .foregroundColor(.white)
//                                        }
//                                        .padding(.horizontal, 20)
//                                        .clipShape(RoundedRectangle(cornerRadius: 15)).background(Color .black.opacity(0.2)).cornerRadius(15)
////                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color .white, lineWidth: 2))
//                                        
////                                        Spacer()
//                                    }
//                                    .padding(.bottom, 20))
                            
                                                    Image("sport4")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        //                        .frame(width: 384, height: 233)
                                                        .frame(maxWidth: .infinity)
                                                        .overlay(
                                                            gradient
                                                        )
                                                        .overlay(
                                                            VStack(alignment: .trailing) {
                                                                Spacer()
//                                                                Text("Standardbild nach Kategorieauswahl")
//                                                                    .font(.systemSemibold(size: 18))
//                                                                    .foregroundColor(.white)
//                                                                    .padding(.horizontal, 30)
//                                                                    .padding(.bottom, 10)
//
//                                                                Text("oder")
//                                                                    .font(.system(size: 14))
//                                                                    .foregroundColor(.white)
//                                                                    .padding(.bottom, 10)
                                                                
                                                                HStack() {
                                                                    Spacer()
                                                                HStack(){
                                                                    Image(systemName: "photo")
                                                                        .font(.system(size: 16, weight: .bold))
                                                                        .imageScale(.medium)
                                                                        .foregroundColor(.white)
                                                                        .frame(width: 28, height: 30)
                                                                    
                                                                    Text("Foto ändern")
                                                                        .font(.systemMedium(size: 15))
                                                                        .foregroundColor(.white)
                                                                }
                                                                .padding(.horizontal, 20)
                                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                                                
                                                                .background(VisualEffectView(effect: UIBlurEffect(style: .light))
                                                                    .edgesIgnoringSafeArea(.all)).cornerRadius(15)
                                                                
                        //                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color .white, lineWidth: 2))
                                                                
//                                                                Spacer()
                                                                } .padding(.horizontal, 16)
                                                            }
                                                            .padding(.bottom, 20)
                                                        )

                                                        .padding(.bottom, 20)
                            
                            //                        Group() {
                            //                            Circle().frame(width: 100, height: 100)
                            //                                .foregroundColor(Color ("super_bright_gray"))
                            //                                .padding(.top, 4)
                            //                                .padding(.bottom, 3)
                            //                                .overlay(
                            //                                    Image(systemName: "camera.fill")
                            //                                        .font(.system(size: 24, weight: .bold))
                            //                                        .imageScale(.medium)
                            //                                        .foregroundColor(Color ("mid_gray"))
                            ////                                        .foreground(gradientRoyalblueViolet_2)
                            //                                        .frame(width: 40, height: 40)
                            //                                )
                            //
                            ////                            Text("Noch ohne Titel")
                            ////                                .font(.system(size: 20))
                            ////                                .fontWeight(.medium)
                            ////                                .foregroundColor(.black)
                            //                        }
                            
                            Group() {
                                
                                HStack(){
                                    Image(systemName: "textformat")
                                        .font(.system(size: 20, weight: .semibold))
                                        .imageScale(.medium)
                                        //                                                                        .foregroundColor(.red)
                                        .foreground(gradientPinkRed)
                                        .frame(width: 40, height: 40)
                                    
                                    ZStack(){
                                        HStack() {
                                            
                                            //                                        VStack(alignment: .leading) {
                                            Button(action: {
                                                withAnimation(.linear(duration: 0.2)) {
                                                    self.showTitleTextField.toggle()
                                                }
                                            })  {
                                                Text("Titel")
                                                    .font(.systemMedium(size: 18))
                                                    //                                                    .fontWeight(.medium)
                                                    .foregroundColor(.black)
                                            }
                                            
                                            
                                            //                                        }
                                            Spacer()
                                            
                                        }
                                        Rectangle()
                                            .frame(height: 0.5)
                                            .foregroundColor(Color ("bright_gray"))
                                            .padding(.leading, 5)
                                            .offset(y: showTitleTextField ? 70 : 30)
                                    }
                                }.padding(.horizontal, 16)
                                .padding(.vertical, 2)
                                //                            .padding(.top, 10)
                                
                                if showTitleTextField {
                                    TextField("Titel", text: $titel)
                                        .font(.system(size: 17))
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 16)
                                        .padding(.leading, 49)
                                        .padding(.vertical, 2)
                                }
                                
                                HStack(){
                                    Image(systemName: "globe")
                                        .font(.system(size: 20, weight: .bold))
                                        .imageScale(.medium)
                                        .foreground(gradientRoyalblueViolet)
                                        .frame(width: 40, height: 40)
                                    
                                    ZStack(){
                                        HStack() {
                                            Text("Ort")
                                                .font(.systemMedium(size: 18))
                                                //                                            .fontWeight(.medium)
                                                .foregroundColor(.black)
                                            Spacer()
                                            
                                            //                                        Text("Las Vegas, Nevada + 25km")
                                            //                                            .font(.system(size: 14))
                                            ////                                                    .fontWeight(.medium)
                                            //                                            .foregroundColor(Color ("gray-1"))
                                        }
                                        Rectangle()
                                            .frame(height: 0.5)
                                            .foregroundColor(Color ("bright_gray"))
                                            //                                        .padding(.leading, 5)
                                            .offset(y: 26)
                                    }
                                }.padding(.horizontal, 16)
                                .padding(.vertical, 2)
                                
                                Button(action: {
                                    withAnimation(.linear(duration: 0.2)) {
                                        self.menuControl.showCategoryMenu.toggle()
                                    }
                                })  {
                                    HStack(){
                                        //                                    Image(systemName: "gamecontroller.fill")
                                        Image(systemName: "gamecontroller.fill")
                                            .font(.system(size: 20, weight: .bold))
                                            .imageScale(.medium)
                                            //                                                                                .foregroundColor(Color ("cherry"))
                                            //                                        .foreground(gradientRoyalblueViolet)
                                            .foreground(gradientTurquoiseBlue)
                                            .frame(width: 40, height: 40)
                                        
                                        ZStack(){
                                            HStack() {
                                                Text("Kategorie")
                                                    .font(.systemMedium(size: 18))
                                                    //                                                .fontWeight(.medium)
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                        }
                                    }
                                }.padding(.horizontal, 16)
                                .padding(.vertical, 2)
                            }
                            
                            Group() {
                                HStack(){
                                    Text("WEITERE DETAILS (OPTIONAL)")
                                        .font(.systemMedium(size: 13))
                                        .fontWeight(.medium)
                                        .foregroundColor(Color ("gray"))
                                    Spacer()
                                }.padding(.horizontal, 16)
                                .padding(.top, 15)
                                .padding(.bottom, 7)
                                
                                HStack(){
                                    Image(systemName: "doc.plaintext")
                                        .font(.system(size: 20, weight: .bold))
                                        .imageScale(.medium)
                                        .foregroundColor(.black)
                                        .frame(width: 40, height: 40)
                                    
                                    ZStack(){
                                        HStack() {
                                            Text("Beschreibung")
                                                .font(.systemMedium(size: 18))
                                                //                                            .fontWeight(.medium)
                                                .foregroundColor(.black)
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .font(.system(size: 16, weight: .bold))
                                                .imageScale(.medium)
                                                .foregroundColor(Color ("mid_gray"))
                                                .frame(width: 24, height: 24)
                                        }
                                        Rectangle()
                                            .frame(height: 0.5)
                                            .foregroundColor(Color ("bright_gray"))
                                            //                                        .padding(.leading, 5)
                                            .offset(y: 26)
                                    }
                                }.padding(.horizontal, 16)
                                .padding(.vertical, 2)
                            }
                            
                            
                            Group() {
                                HStack(){
                                    Image(systemName: "calendar.badge.clock")
                                        .font(.system(size: 20, weight: .bold))
                                        .imageScale(.medium)
                                        .foregroundColor(.black)
                                        .frame(width: 40, height: 40)
                                    
                                    ZStack(){
                                        HStack() {
                                            Text("Wann")
                                                .font(.systemMedium(size: 18))
                                                //                                            .fontWeight(.medium)
                                                .foregroundColor(.black)
                                            Spacer()
                                            
                                            //                                        Text("Heute")
                                            //                                            .font(.system(size: 14))
                                            ////                                                    .fontWeight(.medium)
                                            //                                            .foregroundColor(Color ("gray-1"))
                                        }
                                        Rectangle()
                                            .frame(height: 0.5)
                                            .foregroundColor(Color ("bright_gray"))
                                            //                                        .padding(.leading, 5)
                                            .offset(y: 26)
                                    }
                                }.padding(.horizontal, 16)
                                .padding(.vertical, 2)
                            }
                            
                            
                            Group() {
                                HStack(){
                                    Image(systemName: "photo")
                                        .font(.system(size: 20, weight: .bold))
                                        .imageScale(.medium)
                                        .foregroundColor(.black)
                                        .frame(width: 40, height: 40)
                                    
                                    ZStack(){
                                        HStack() {
                                            Text("Gruppenfoto ändern")
                                                .font(.systemMedium(size: 18))
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    }
                                }.padding(.horizontal, 16)
                                .padding(.vertical, 2)
                            }
                            
                            
                            Group() {
                                HStack(){
                                    Text("TREFFPUNKT, NUR FÜR BESTÄTIGTE GRUPPENMITGLIEDER SICHTBAR (OPTIONAL)")
                                        .font(.systemMedium(size: 13))
                                        .fontWeight(.medium)
                                        .foregroundColor(Color ("gray"))
                                    Spacer()
                                }.padding(.horizontal, 16)
                                .padding(.top, 9)
                                .padding(.bottom, 7)
                            }
                            
                            
                            Group() {
                                HStack(){
                                    Image(systemName: "location.fill")
                                        .font(.system(size: 20, weight: .bold))
                                        .imageScale(.medium)
                                        .foregroundColor(.black)
                                        .frame(width: 40, height: 40)
                                    
                                    ZStack(){
                                        HStack() {
                                            Text("Treffpunkt")
                                                .font(.systemMedium(size: 18))
                                                //                                            .fontWeight(.medium)
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        Rectangle()
                                            .frame(height: 0.5)
                                            .foregroundColor(Color ("bright_gray"))
                                            //                                        .padding(.leading, 5)
                                            .offset(y: 26)
                                    }
                                }.padding(.horizontal, 16)
                                .padding(.vertical, 2)
                            }
                            
                            
                            Group() {
                                HStack(){
                                    Image(systemName: "clock")
                                        .font(.system(size: 20, weight: .bold))
                                        .imageScale(.medium)
                                        .foregroundColor(.black)
                                        .frame(width: 40, height: 40)
                                    
                                    ZStack(){
                                        HStack() {
                                            Text("Zeit")
                                                .font(.systemMedium(size: 18))
                                                //                                            .fontWeight(.medium)
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    }
                                }.padding(.horizontal, 16)
                                .padding(.vertical, 2)
                            }
                            
                        }
                        //                    .padding(.top, 4)
                    }
                }
                
                // Header Section
                VStack(){
                    ZStack(){
                        HStack() {
                            Button(action: {
                                withAnimation(.linear(duration: 0.1)) {
                                    //                                self.changePage()
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            }) {
                                HStack() {
                                    Text("abbrechen")
                                        .font(.systemMedium(size: 17))
                                        .foregroundColor(.white)
                                        .padding(7)
                                        .padding(.horizontal, 4)
                                }
                                .background(Color .black.opacity(0.2))
                                
//                                .background(VisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
//                                                .edgesIgnoringSafeArea(.all))
                                .frame(height: 24)
                                .cornerRadius(12)
                                
                            }
                            Spacer()
                            
                            NavigationLink(destination:
                                            UserComponent(
                                                pageIndex: self.$pageIndex,
                                                selectedUsers: self.$selectedUsers,
                                                showingDetail: self.$showingDetail,
                                                groups: self.$groups
                                            )) {
                                HStack() {
                                    Text("weiter")
                                        .font(.systemMedium(size: 17))
                                        .foregroundColor(.white)
                                        .padding(7)
                                        .padding(.horizontal, 4)
                                }
                                .background(Color .black.opacity(0.2))
                                
//                                .background(VisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
//                                                .edgesIgnoringSafeArea(.all))
                                .frame(height: 24)
                                .cornerRadius(12)
                            }
                            
                            //                        Button(action: {
                            //                            self.finish()
                            //                        }) {
                            //                            Text("Fertig")
                            //                                .font(.systemBold(size: 17))
                            //                                //                                .fontWeight(.medium)
                            //                                .foregroundColor(.white)
                            //                            //                                .foreground(gradientRoyalblueViolet)
                            //                        }
                        }
                        .padding(.horizontal, 16)
                        
                        //                    HStack() {
                        //                        Spacer()
                        //                        Text("Gruppendetails")
                        //                            .font(.systemSemibold(size: 18))
                        //                            .foregroundColor(.white)
                        //                        //                            .fontWeight(.semibold)
                        //                        Spacer()
                        //                    }
                    }
                    .padding(.bottom, 18)
                    .padding(.top, 15)
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

//struct UserComponentGroupDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        UserComponentGroupDetails()
//    }
//}
