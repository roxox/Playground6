//
//  GroupsView.swift
//  Playground6
//
//  Created by Sebastian Fox on 13.11.20.
//

import SwiftUI

struct GroupsView: View {
    @Binding var groups: [AppUserGroup]
    @Binding var design: Design
    
    var body: some View {
        ScrollView() {
            Rectangle()
                .fill(Color .white)
                .frame(height: 20)
            
            HStack() {
                Text("\(groups.count) Treffer zu deiner Suche")
                    .font(.systemMedium(size: 18))
            }
            
            HStack() {
                Text("Gruppen in der Nähe")
                    .font(.systemBold(size: 36))
            }
            
            Rectangle()
                .fill(Color .white)
                .frame(height: 10)
            
            GroupList(groups: $groups, design: $design)
        }
    }
}

//struct GroupsView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsView()
//    }
//}
