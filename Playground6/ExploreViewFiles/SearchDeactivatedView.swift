//
//  SearchDeactivatedView.swift
//  Playground6
//
//  Created by Sebastian Fox on 27.10.20.
//

import SwiftUI

struct SearchDeactivatedView: View {
    @EnvironmentObject var menuControl: MenuControl
    @Binding var isSearchActive: Bool
    
    var body: some View {
        //        ScrollView() {
        VStack() {
            Image("rocket")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 200)
            
                            Button(action: {
                                withAnimation(.linear(duration: 0.2)) {
//                                    isSearchActive.toggle()
                                    menuControl.showSearchMenu = true
                                }
                            }) {
                                Text("Suche aktivieren!")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foreground(gradientRoyalblueViolet)
                                    .padding(.top, 30)
                            }
        }
        //        }
    }
}

//struct SearchDeactivatedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchDeactivatedView()
//    }
//}
