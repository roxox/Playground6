//
//  PlaceholderView.swift
//  Playground6
//
//  Created by Sebastian Fox on 17.12.20.
//

import SwiftUI

struct PlaceholderView: View {
    @State var currentPage = 0
    @State var currentPage2 = 0
    @State var index = 0
    @State var createNewGroup: Bool = true
    @State var users = appUserData
    
    private let items: [String] = ["Gruppen", "Personen"]
    
    var body: some View {
           
        ScrollView() {
            VStack{
                TabView(selection: $index) {
//                    UsersView(users: $users, createNewGroup: $createNewGroup)
//                        .tag(0)
//                    UsersMainView(users: $users, createNewGroup: $createNewGroup)
//                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        }
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
